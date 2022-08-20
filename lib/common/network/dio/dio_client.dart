import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:dio_flutter_transformer2/dio_flutter_transformer2.dart';
import 'package:flutter/foundation.dart';
import 'package:freeland/common/network/dio/error_interceptor.dart';

// const _defaultConnectTimeout = 10000;
// const _defaultReceiveTimeout = 10000;

class DioClient with DioMixin implements Dio {
  DioClient(
    this.baseUrl, {
    List<Interceptor> interceptors = const [],
  }) {
    options = BaseOptions(
      connectTimeout: 30000,
      receiveTimeout: 30000,
      sendTimeout: 30000,
    );
    transformer = FlutterTransformer();
    httpClientAdapter = DefaultHttpClientAdapter();
    options
      ..baseUrl = baseUrl
      ..headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        "Transfer-Encoding": "chunked"
      };
    if (interceptors.isNotEmpty) {
      this.interceptors.addAll(interceptors);
    }
    final logInterceptor = LogInterceptor(
      responseBody: true,
      error: true,
      requestHeader: true,
      responseHeader: false,
      request: false,
      requestBody: true,
    );
    final tokenDio = Dio(options)
      ..interceptors.addAll([
        logInterceptor,
      ]);
    this.interceptors.addAll([
      // RefreshTokenInterceptor<AuthTokenModel>(
      //   dio: this,
      //   tokenProtocol: TokenProtocol(
      //     shouldRefresh: (response, token) => false,
      //   ),
      //   onRevoked: (dioError) {},
      //   tokenStorage: getIt<ReactiveTokenStorage>(),
      //   tokenDio: tokenDio,
      //   refreshToken: (token, dio) async {
      //     ///ToDo:
      //     // final response = await dio.post(
      //     //   AppUri.refreshToken,
      //     //   queryParameters: {
      //     //     'userId': getIt<AuthApi>().getUser()?.id,
      //     //     'refreshToken': token.refreshToken,
      //     //   },
      //     // );
      //     // final authTokenModel = AuthTokenModel.fromMap(response.data);
      //     final authTokenModel =
      //         AuthTokenModel(accessToken: "", refreshToken: "");
      //     return authTokenModel;
      //   },
      // ),
      if (!kReleaseMode) logInterceptor,
      ErrorInterceptor(),
    ]);
  }

  final String baseUrl;
}
