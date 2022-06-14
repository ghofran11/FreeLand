import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

const _intCodes = {
  'ar': 0,
  'en': 1,
};

class LocalizationInterceptor extends Interceptor {
  final BuildContext context;

  LocalizationInterceptor(this.context);

  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    ///ToDo
    options.headers.addAll({'lang': "ar"});
    handler.next(options);
  }
}
