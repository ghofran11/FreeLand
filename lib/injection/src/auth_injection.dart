import 'package:dio/dio.dart';
import 'package:freeland/app/auth/domain/repos/auth_repository.dart';
import 'package:freeland/app/auth/infrastructure/data_source/local/auth_local.dart';
import 'package:freeland/app/auth/infrastructure/data_source/local/reactive_token_storage.dart';
import 'package:freeland/app/auth/infrastructure/data_source/local/reactive_user_stream.dart';
import 'package:freeland/app/auth/infrastructure/data_source/remote/aut_remote.dart';
import 'package:freeland/app/auth/infrastructure/data_source/remote/refresh_device_token.dart';
import 'package:freeland/app/auth/infrastructure/repo/auth_repository_impl.dart';
import 'package:freeland/app/auth/presentation/login/login_bloc/login_bloc.dart';
import 'package:freeland/app/home/infrastructure/data_source/remote/home_remote.dart';
import 'package:freeland/app/home/infrastructure/repo/home_repository_impl.dart';
import 'package:freeland/app/home/presentation/state/bloc/home_bloc.dart';
import 'package:freeland/app/info/country/infrastrcture/repo/country_repository.dart';
import 'package:freeland/app/notifications/infrastructure/data_source/remote.dart';
import 'package:freeland/app/notifications/infrastructure/repo/notification_repository_impl.dart';
import 'package:freeland/app/notifications/presentation/state/notification_bloc.dart';
import 'package:freeland/app/projects/domain/repos/project_repository.dart';
import 'package:freeland/app/projects/infrastructure/data_source/remote/project_remote.dart';
import 'package:freeland/app/projects/infrastructure/repo/project_repository_impl.dart';
import 'package:freeland/app/projects/presentation/state/bloc/project_bloc.dart';
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

  getIt.registerFactory(() => HomeRemote(getIt<Dio>()));
  getIt.registerFactory(() => HomeRepositoryImpl( remote: getIt<HomeRemote>(),));
  getIt.registerFactory(() => HomeBloc( getIt<HomeRepositoryImpl>(),));

  getIt.registerFactory(() => ProjectRemote(getIt<Dio>()));
  getIt.registerFactory(() => ProjectRepositoryImpl( remote: getIt<ProjectRemote>(),));


  getIt.registerFactory(() => CountryBloc(getIt<CountryRepo>()));
  getIt.registerFactory(() => ProjectBloc(getIt<ProjectRepositoryImpl>()));
  getIt.registerFactory(() => NotificationRemote(getIt<Dio>()));

  getIt.registerFactory(() => NotificationRepositoryImpl(remote: getIt<NotificationRemote>()));

  getIt.registerFactory(() => NotificationBloc(getIt<NotificationRepositoryImpl>()));
}
