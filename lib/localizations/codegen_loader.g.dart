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

  static const Map<String,dynamic> en = {
  "message": {
    "errorToastDefaultMessage": "حدث خطأ ما",
    "successToastDefaultMessage": "تمت العملية بنجاح",
    "emptyData": "لا يوجد بيانات",
    "retry": "إعادة المحاولة",
    "noInternet": "لا يوجد إتصال في الإنترنت",
    "timeOut": "انتهت مهلة الإتصال بالخادم",
    "server_error": "حدث خطا في الخادم"
  },
  "validation": {
    "email": "أدخل بريدك الإلكتروني بشكل صحيح",
    "password": "أدخل كلمة المرور بشكل صحيح",
    "name": "أدخل اسمك بشكل صحيح",
    "confirm_password": "أدخل كلمة المرور بشكل متطابق",
    "validation_data": "أدخل البيانات بشكل صحيح",
    "choose_strong": "اختر كلمة مرور قوية",
    "number": "أدخل الرقم بشكل صحيح",
    "validation": "تأكيد حسابك",
    "enter_code": "يرجى إدخال الرمز المرسل إليك",
    "re_request_code": "أعد طلب الرمز",
    "pdf_only": "رجاء اختر ملف PDF",
    "required": "يرجى ملء الحقل"
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en};
}
