import 'package:easy_localization/easy_localization.dart';
import 'package:freeland/localization/locale_keys.g.dart';

class AppException implements Exception {
  final String message;

  final Exception innerException;

  AppException(this.message, this.innerException);

  factory AppException.unknown() => AppException(
      LocaleKeys.message_errorToastDefaultMessage.tr(), Exception());

  factory AppException.known(message) => AppException(message, Exception());

  @override
  String toString() => "message : $message, innerException: $innerException";
}
