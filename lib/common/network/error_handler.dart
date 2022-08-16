import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:freeland/common/network/app_exception.dart';

/// To use in repo
Future<Either<String, U>> throwAppException<U>(
    FutureOr<U> Function() call) async {
  try {
    return Right(await call());
  } on AppException catch (e) {
    return Left(e.message);
  } catch (e, s) {
    log(e.toString(), stackTrace: s);
    throw AppException.unknown();
  }
}

///To use in remote
Future<T> throwDioException<T>(FutureOr<T> Function() call) async {
  try {
    return await call();
  } on DioError catch (e) {
    throw e.error;
  } catch (e, s) {
    log(e.toString(), stackTrace: s);
    throw AppException.unknown();
  }
}
