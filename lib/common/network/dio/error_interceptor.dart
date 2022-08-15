import 'dart:io';

import 'package:dio/dio.dart';
import 'package:freeland/common/network/app_exception.dart';

class ErrorInterceptor extends Interceptor {
  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.error is SocketException) {
      err.error = AppException.known("No Internet");
      handler.next(err);
    } else if (err.type == DioErrorType.connectTimeout ||
        err.type == DioErrorType.sendTimeout ||
        err.type == DioErrorType.receiveTimeout) {
      err.error = AppException.known("TimeOut");
      handler.reject(err);
    } else if (err.type == DioErrorType.response &&
        err.response?.statusCode == 500) {
      err.error = AppException.known("Server Error");
      handler.next(err);
    } else if (err.type == DioErrorType.response) {
      var data = err.response?.data;
      err.error =
          data is String ? AppException.known(data) : AppException.unknown();
      handler.next(err);
    } else {
      err.error = AppException.unknown();
      handler.next(err);
    }
  }
}
