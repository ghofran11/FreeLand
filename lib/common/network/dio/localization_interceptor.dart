import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
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
    options.headers.addAll({'lang': _intCodes[context.locale.languageCode]});
    handler.next(options);
  }
}
