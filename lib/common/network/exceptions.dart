import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'exceptions.freezed.dart';

@freezed
class NetworkExceptions with _$NetworkExceptions {
  const factory NetworkExceptions.requestCancelled() = RequestCancelled;

  const factory NetworkExceptions.unauthorisedRequest() = UnauthorisedRequest;

  const factory NetworkExceptions.userNoExist() = UserNoExist;

  const factory NetworkExceptions.blockedUser() = BlockedUser;

  const factory NetworkExceptions.badRequest({String? message}) = BadRequest;

  const factory NetworkExceptions.wrongCode() = WrongCode;

  const factory NetworkExceptions.notFound(String reason) = NotFound;

  const factory NetworkExceptions.methodNotAllowed() = MethodNotAllowed;

  const factory NetworkExceptions.notAcceptable() = NotAcceptable;

  const factory NetworkExceptions.requestTimeout() = RequestTimeout;

  const factory NetworkExceptions.sendTimeout() = SendTimeout;

  const factory NetworkExceptions.conflict() = Conflict;

  const factory NetworkExceptions.internalServerError() = InternalServerError;

  const factory NetworkExceptions.notImplemented() = NotImplemented;

  const factory NetworkExceptions.serviceUnavailable() = ServiceUnavailable;

  const factory NetworkExceptions.noInternetConnection() = NoInternetConnection;

  const factory NetworkExceptions.formatException() = FormatException;

  const factory NetworkExceptions.unableToProcess() = UnableToProcess;

  const factory NetworkExceptions.defaultError(String error) = DefaultError;

  const factory NetworkExceptions.unexpectedError() = UnexpectedError;

  ///custom API Errors
  const factory NetworkExceptions.removeCodeError(String error) =
      RemoveCodeError;

  static NetworkExceptions getDioException(error, {StackTrace? s}) {
    log('NetworkExceptions');
    log(error.toString());
    log(s.toString());
    if (error is Exception) {
      try {
        NetworkExceptions? networkExceptions;
        if (error is DioError) {
          switch (error.type) {
            case DioErrorType.cancel:
              networkExceptions = const NetworkExceptions.requestCancelled();
              break;
            case DioErrorType.connectTimeout:
              networkExceptions = const NetworkExceptions.requestTimeout();
              break;
            case DioErrorType.other:
              {
                if (error.message.contains('SocketException')) {
                  networkExceptions =
                      const NetworkExceptions.noInternetConnection();
                } else {
                  networkExceptions = const NetworkExceptions.unexpectedError();
                }
              }
              break;
            case DioErrorType.receiveTimeout:
              networkExceptions = const NetworkExceptions.sendTimeout();
              break;
            case DioErrorType.response:
              switch (error.response!.statusCode) {
                case 400:
                  networkExceptions = NetworkExceptions.badRequest(
                      message: error.response?.data);
                  break;
                case 401:
                  networkExceptions =
                      const NetworkExceptions.unauthorisedRequest();
                  break;
                case 403:
                  networkExceptions = const NetworkExceptions.userNoExist();
                  break;
                case 204:
                  networkExceptions = const NetworkExceptions.userNoExist();
                  break;
                case 404:
                  networkExceptions =
                      const NetworkExceptions.notFound("Not found");
                  break;
                case 409:
                  networkExceptions = const NetworkExceptions.conflict();
                  break;
                case 408:
                  networkExceptions = const NetworkExceptions.requestTimeout();
                  break;
                case 500:
                  networkExceptions =
                      const NetworkExceptions.internalServerError();
                  break;
                case 503:
                  networkExceptions =
                      const NetworkExceptions.serviceUnavailable();
                  break;
                case 502:
                  networkExceptions =
                      const NetworkExceptions.serviceUnavailable();
                  break;
                default:
                  var responseCode = error.response!.statusCode;
                  networkExceptions = NetworkExceptions.defaultError(
                    "Received invalid status component: $responseCode",
                  );
              }
              break;
            case DioErrorType.sendTimeout:
              networkExceptions = const NetworkExceptions.sendTimeout();
              break;
          }
        } else if (error is SocketException) {
          networkExceptions = const NetworkExceptions.noInternetConnection();
        } else {
          networkExceptions = const NetworkExceptions.unexpectedError();
        }
        return networkExceptions;
      } on FormatException catch (_) {
        return const NetworkExceptions.formatException();
      } catch (_) {
        return const NetworkExceptions.unexpectedError();
      }
    } else {
      if (error.toString().contains("is not a subtype of")) {
        return const NetworkExceptions.unableToProcess();
      } else if (error.toString().contains('SocketException')) {
        return const NetworkExceptions.noInternetConnection();
      } else {
        return const NetworkExceptions.unexpectedError();
      }
    }
  }

  static String getErrorMessage(NetworkExceptions networkExceptions) {
    var errorMessage = "";
    networkExceptions.when(
      wrongCode: () => errorMessage = "كود خاطئ",
      notImplemented: () {
        errorMessage = "Not Implemented";
      },
      requestCancelled: () {
        errorMessage = "Request Cancelled";
      },
      internalServerError: () {
        errorMessage = "تعذر الاتصال بالخادم!";
      },
      notFound: (String reason) {
        errorMessage = reason;
      },
      serviceUnavailable: () {
        errorMessage = "حدث خطأ أثناء الاتصال بالخادم!";
      },
      methodNotAllowed: () {
        errorMessage = 'Method Allowed';
      },
      badRequest: (message) {
        if (message?.contains('is already taken') ?? false) {
          errorMessage = 'هذا الحساب موجود';
        } else if (message == 'Wrong component') {
          errorMessage = "الكود غير  موجود أو مفعل  مسبقاًَ!";
        } else {
          errorMessage = "حدث خطأ أثناء الاتصال بالخادم!";
        }
      },
      unauthorisedRequest: () {
        errorMessage = "انتهت صلاحية الجلسة";
      },
      unexpectedError: () {
        errorMessage = "حدث خطأ غير متوقع!";
      },
      requestTimeout: () {
        errorMessage = "انتهت مهلة الاتصال بالخادم!";
      },
      noInternetConnection: () {
        errorMessage = "تأكد من اتصالك بالانترنت!";
      },
      conflict: () {
        errorMessage = "Error due to a conflict";
      },
      sendTimeout: () {
        errorMessage = "انتهت مهلة الاتصال بالخادم!";
      },
      unableToProcess: () {
        errorMessage = "حدث خطأ غير متوقع!";
      },
      defaultError: (String error) {
        errorMessage = error;
      },
      formatException: () {
        errorMessage = 'حدث خطا غير متوقع!';
      },
      notAcceptable: () {
        errorMessage = "Not acceptable";
      },
      removeCodeError: (String message) {
        errorMessage = message;
      },
      blockedUser: () {
        errorMessage = 'هذا الحساب محظور!';
      },
      userNoExist: () {
        errorMessage = 'هناك خطأ في كلمة المرور او اسم المستخدم!';
      },
    );
    return errorMessage;
  }
}
