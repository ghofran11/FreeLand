import 'dart:async';
import 'dart:developer';

import 'package:bot_toast/bot_toast.dart';
import 'package:dio_refresh_bot/dio_refresh_bot.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freeland/app/auth/domain/repos/auth_repository.dart';
import 'package:freeland/common/constant/src/keys.dart';
import 'package:freeland/common/utils/storage_service.dart';
import 'package:freeland/injection/injection.dart';

part 'app_manager_event.dart';
part 'app_manager_state.dart';

///This bloc use for redirect in go router
class AppManagerBloc extends Bloc<AppManagerEvent, AppManagerState> {
  AppManagerBloc(
      {required this.lazyAuthRepository,
      this.doBeforeOpen,
      required this.doAfterOpen})
      : super(const AppManagerState(status: Status.initial)) {
    on<AppManagerEvent>(_handler);
  }

  /// Wait [getIt] injection before read AuthRepo implementation from service locator
  final AuthRepository Function() lazyAuthRepository;

  /// Do some initiation before close splash and open app
  final FutureOr<void> Function()? doBeforeOpen;
  final FutureOr<void> Function() doAfterOpen;

  late final AuthRepository _authRepository;

  late final StreamSubscription<AuthStatus> _authStateStream;

  FutureOr<void> _handler(
      AppManagerEvent event, Emitter<AppManagerState> emit) async {
    if (event is AppMangerUnExpiredApp) {
      emit(state.copyWith(expired: false, checkedUpdate: true));
    }
    if (event is AppMangerExpiredApp) {
      emit(state.copyWith(
          expired: true, isSupported: event.isSupported, checkedUpdate: true));
    }
    if (event is AppManagerStarted) {
      try {
        await doBeforeOpen?.call();
      } catch (e, s) {
        log(e.toString(), stackTrace: s);
      }

      ///toDo: change this to respect DDD Arch
      emit(state.copyWith(
          firstOpen:
              getIt<StorageService<SharedStorage>>().getBool(kIsFirstOpen)));

      _authRepository = lazyAuthRepository();
      await doAfterOpen();
      _authStateStream = _authRepository.authStatusStream.listen(
        (event) {
          add(AppManageStatusChanged(
              status: event.status, message: event.message));
        },
      );
    } else if (event is AppManageStatusChanged) {
      emit(state.copyWith(status: event.status, message: event.message));
    } else if (event is AppManagerLoggedOut) {
      BotToast.showLoading();
      try {
        await _authRepository.logout();
      } catch (e) {
        debugPrint(e.toString());
      }
      BotToast.closeAllLoading();
    }
  }

  @override
  Future<void> close() {
    _authStateStream.cancel();
    return super.close();
  }
}
