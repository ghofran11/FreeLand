// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> ar = {
  "message": {
    "errorToastDefaultMessage": "حدث خطأ ما",
    "successToastDefaultMessage": "تمت العملية بنجاح",
    "emptyData": "لا يوجد بيانات",
    "retry": "إعادة المحاولة",
    "noInternet": "لا يوجد إتصال في الإنترنت",
    "timeOut": "انتهت مهلة الإتصال بالخادم",
    "server_error": "حدث خطا في الخادم"
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": ar};
}
