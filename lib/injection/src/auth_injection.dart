import 'package:dio/dio.dart';
import 'package:freeland/app/auth/domain/repos/auth_repository.dart';
import 'package:freeland/app/auth/infrastructure/data_source/local/auth_local.dart';
import 'package:freeland/app/auth/infrastructure/data_source/local/reactive_token_storage.dart';
import 'package:freeland/app/auth/infrastructure/data_source/local/reactive_user_stream.dart';
import 'package:freeland/app/auth/infrastructure/data_source/remote/aut_remote.dart';
import 'package:freeland/app/auth/infrastructure/data_source/remote/refresh_device_token.dart';
import 'package:freeland/app/auth/infrastructure/repo/auth_repository_impl.dart';
import 'package:freeland/app/auth/presentation/login/login_bloc/login_bloc.dart';
import 'package:freeland/app/info/country/infrastrcture/repo/country_repository.dart';
import 'package:freeland/common/platform_services/firebase/notification_firebase.dart';
import 'package:freeland/common/utils/storage_service.dart';
import 'package:freeland/injection/injection.dart';

import '../../app/auth/presentation/sign_up/sign_up_bloc/sign_up_bloc.dart';
import '../../app/info/country/infrastrcture/data_source/remote/country_remote.dart';
import '../../app/info/country/presentation/country_bloc/country_bloc.dart';

Future<void> authInject() async {
  getIt.registerSingleton<AuthLocal>(
      AuthLocal(local: getIt<StorageService<SharedStorage>>()));
  getIt.registerSingleton<AuthRemote>(AuthRemote(getIt<Dio>()));
  getIt.registerSingleton<ReactiveUser>(ReactiveUser(getIt<AuthLocal>()));
  getIt.registerSingleton<RefreshDeviceTokenService>(RefreshDeviceTokenService(
    dio: getIt<Dio>(),
    firebaseNotificationService: getIt<FirebaseNotificationService>(),
    storageService: getIt<StorageService<SharedStorage>>(),
  ));
  getIt.registerSingleton<AuthRepository>(AuthRepositoryImpl(
      reactiveTokenStorage: getIt<ReactiveTokenStorage>(),
      remote: getIt<AuthRemote>(),
      local: getIt<AuthLocal>(),
      reactiveUser: getIt<ReactiveUser>(),
      notificationService: getIt<FirebaseNotificationService>(),
      refreshDeviceTokenService: getIt<RefreshDeviceTokenService>()));

  getIt.registerFactory(() => LoginBloc(getIt<AuthRepository>()));
  getIt.registerFactory(() => SignUpBloc(getIt<AuthRepository>()));

  getIt.registerFactory(() => CountryRemote(getIt<Dio>()));
  getIt.registerFactory(() => CountryRepo(getIt<CountryRemote>()));

  getIt.registerFactory(() => CountryBloc(getIt<CountryRepo>()));
}
