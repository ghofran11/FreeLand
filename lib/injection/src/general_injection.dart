import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:freeland/app/auth/infrastructure/data_source/local/reactive_token_storage.dart';
import 'package:freeland/common/constant/src/url.dart';
import 'package:freeland/common/network/dio/dio_client.dart';
import 'package:freeland/common/platform_services/firebase/notification_firebase.dart';
import 'package:freeland/common/utils/storage_service.dart';
import 'package:freeland/injection/injection.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future generalInject(BuildContext context) async {
  getIt.registerSingleton<SharedPreferences>(
      await SharedPreferences.getInstance());
  getIt.registerSingleton<StorageService<SharedStorage>>(
      StorageService.shared(getIt<SharedPreferences>()));

  getIt.registerSingleton<ReactiveTokenStorage>(
      ReactiveTokenStorage(getIt<StorageService<SharedStorage>>()));

  getIt.registerSingleton<FirebaseNotificationService>(
      FirebaseNotificationServiceImpl());
  getIt.registerSingleton<Dio>(
    DioClient(AppUri.baseUrlDevelopment + "api/", context: context),
  );
}
