import 'dart:async';

import 'package:dio_refresh_bot/dio_refresh_bot.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/cupertino.dart';
import 'package:freeland/app/auth/domain/entities/login_params.dart';
import 'package:freeland/app/auth/domain/entities/sign_up_params.dart';
import 'package:freeland/app/auth/domain/repos/auth_repository.dart';
import 'package:freeland/app/auth/infrastructure/data_source/local/auth_local.dart';
import 'package:freeland/app/auth/infrastructure/data_source/local/reactive_token_storage.dart';
import 'package:freeland/app/auth/infrastructure/data_source/local/reactive_user_stream.dart';
import 'package:freeland/app/auth/infrastructure/data_source/remote/aut_remote.dart';
import 'package:freeland/app/auth/infrastructure/data_source/remote/refresh_device_token.dart';
import 'package:freeland/app/auth/infrastructure/models/auth_token_model.dart';
import 'package:freeland/common/network/app_exception.dart';
import 'package:freeland/common/network/error_handler.dart';
import 'package:freeland/common/platform_services/firebase/notification_firebase.dart';
import 'package:freeland/core/user/entities/user.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthLocal local;
  final AuthRemote remote;
  final ReactiveTokenStorage reactiveTokenStorage;
  final ReactiveUser reactiveUser;
  final FirebaseNotificationService notificationService;
  final RefreshDeviceTokenService refreshDeviceTokenService;
  StreamSubscription<AuthStatus>? _streamSubscription;

  AuthRepositoryImpl({
    required this.remote,
    required this.local,
    required this.reactiveTokenStorage,
    required this.reactiveUser,
    required this.notificationService,
    required this.refreshDeviceTokenService,
  }) {
    _init();
  }

  _init() {
    if (getUser() != null) {
      refreshDeviceTokenService.start();
      _streamSubscription ??=
          reactiveTokenStorage.authenticationStatus.listen((event) async {
        if (event.status == Status.unauthenticated) {
          await logout();
        }
      });
    }
  }

  @override
  Future<Either<String, Never>> login({
    required LoginParams params,
  }) async {
    final token = await _getToken();
    return throwAppException<Never>(() async {
      final User result =
          await remote.login(params: params, deviceToken: token);
      //update user storage and token
      await reactiveTokenStorage.write(AuthTokenModel(
        accessToken: result.accessToken,
        refreshToken: result.refreshToken,
      ));
      final User userWithPass = result.copyWith(password: params.password);
      await setUser(userWithPass);
      _init();
      await _subscribeToTopics();
      return null;
    });
  }

  @override
  Future<String?> signUp({
    required SignUpParams params,
  }) async {
    final token = await _getToken();
    try {
      final User result =
          await remote.signUp(params: params, deviceToken: token);
      _saveUser(result, params);
      return null;
    } on AppException catch (e) {
      return e.message;
    }
  }

  @override
  Future<bool> logout() async {
    // await _unsubscribeFromTopics();
    await local.removeUser();
    await reactiveTokenStorage.delete();
    reactiveUser.delete();
    _streamSubscription?.cancel();
    refreshDeviceTokenService.stop();
    return true;
  }

  @override
  Future<void> setUser(User value) async {
    await local.setUser(value);
    reactiveUser.write(value);
  }

  @override
  User? getUser() {
    return local.getUser();
  }

  @override
  Stream<User?> get userStream => reactiveUser.stream;

  _saveUser(User user, SignUpParams params) async {
    await reactiveTokenStorage.write(AuthTokenModel(
      accessToken: user.accessToken,
      refreshToken: user.refreshToken,
    ));
    final User userWithPass = user.copyWith(password: params.password);
    await setUser(userWithPass);
    await _subscribeToTopics();
  }

  Future<String?> _getToken() async {
    try {
      return await notificationService.getToken();
    } catch (_) {
      return null;
    }
  }

  _subscribeToTopics() async {
    try {
      return await notificationService.subscribeToTopics(topics: allTopics);
    } catch (_) {}
  }

  _unsubscribeFromTopics() async {
    try {
      return await notificationService.unsubscribeFromTopics(topics: allTopics);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Stream<AuthStatus> get authStatusStream =>
      reactiveTokenStorage.authenticationStatus;
}
