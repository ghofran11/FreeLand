import 'package:dio/dio.dart';
import 'package:freeland/app/auth/domain/entities/login_params.dart';
import 'package:freeland/app/auth/domain/entities/sign_up_params.dart';
import 'package:freeland/common/constant/src/url.dart';
import 'package:freeland/common/network/error_handler.dart';
import 'package:freeland/core/user/entities/user.dart';

class AuthRemote {
  final Dio _dio;

  AuthRemote(Dio dio) : _dio = dio;

  Future<User> login({
    required LoginParams params,
    required String? deviceToken,
  }) async {
    return throwDioException<User>(() async {
      late final Response response;
      var json = params.toJson();
      response = await _dio.post(AppUri.signInUser, data: json);
      return User.fromMap(response.data);
    });
  }

  Future<User> signUp({
    required SignUpParams params,
    required String? deviceToken,
  }) async {
    return throwDioException(() async {
      final response =
          await _dio.post(AppUri.signUpUser, data: await params.toJson());
      return User.fromMap(response.data);
    });
  }

  Future<bool> refreshDeviceToken({
    required String token,
  }) async {
    throwDioException(() async {
      await _dio.post(
        AppUri.refreshDeviceToken,
        queryParameters: {
          'refreshToken': token,
        },
      );
      return true;
    });
    return false;
  }
}
