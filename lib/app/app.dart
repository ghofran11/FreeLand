import 'dart:async';
import 'dart:developer';

import 'package:bot_toast/bot_toast.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freeland/app/auth/domain/repos/auth_repository.dart';
import 'package:freeland/app/auth/presentation/state/app_manager_bloc/app_manager_bloc.dart';
import 'package:freeland/common/config/firebase.dart';
import 'package:freeland/common/config/theme/src/styles.dart';
import 'package:freeland/common/config/theme/src/theme.dart';
import 'package:freeland/common/platform_services/firebase/notification_firebase.dart';
import 'package:freeland/core/user/provider/user_provider.dart';
import 'package:freeland/injection/injection.dart';
import 'package:freeland/router/route_config.dart';
import 'package:provider/provider.dart';

import 'profile/presentation/state/my_proflile_bloc/my_profile_bloc.dart';
import 'root/state/navigation_bar_provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  final _botToastBuilder = BotToastInit();
  late RouterConfig routerConfig;
  late AppManagerBloc _provider;
  MyProfileBloc? _profile;
  bool initialized = false;

  @override
  void initState() {
    super.initState();
    _provider = AppManagerBloc(
      doBeforeOpen: _beforeOpen,
      doAfterOpen: () {
        _profile = MyProfileBloc();
      },
      lazyAuthRepository: () => getIt<AuthRepository>(),
    )..add(AppManagerStarted());
    routerConfig = RouterConfig(provider: _provider);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // final injection = initInjection(context);

    return DevicePreview(
        enabled: false,
        builder: (context) => MultiProvider(
              providers: [
                ChangeNotifierProvider(create: (_) => UserProvider()),
                ChangeNotifierProvider(
                    create: (_) => BottomNavigationProvider()),
                BlocProvider<AppManagerBloc>.value(value: _provider),
                if (_profile != null)
                  BlocProvider<MyProfileBloc>.value(
                      value: _profile!..add(MyProfileFetched())),
              ],
              child: Builder(builder: (context) {
                return ScreenUtilInit(
                  designSize: designSize,
                  builder: (context, _) => MaterialApp.router(
                    debugShowCheckedModeBanner: false,
                    routeInformationParser:
                        routerConfig.router.routeInformationParser,
                    routerDelegate: routerConfig.router.routerDelegate,
                    theme: AppThemes.lightThemeData,
                    builder: (context, child) {
                      child = _botToastBuilder(context, child);
                      child = DevicePreview.appBuilder(context, child);
                      return Builder(builder: (context) {
                        return child!;
                      });
                    },
                  ),
                );
              }),
            ));
  }

  FutureOr<void> _beforeOpen() async {
    if (!initialized) {
      final Completer<void> completer = Completer();
      await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform);
      await initInjection(context);
      try {
        await getIt<FirebaseNotificationService>()
            .setUpFirebase()
            .timeout(const Duration(seconds: 15), onTimeout: () {
          completer.complete();
        });
        getIt<FirebaseNotificationService>().getToken().then((value) {
          log(value ?? '', name: 'Firebase Token');
        });
        if (!completer.isCompleted) {
          completer.complete();
        }
      } catch (e) {
        completer.complete();
        log(e.toString(), name: 'Firebase Token error');
      }
      setState(() {
        initialized = true;
      });
      return completer.future;
    }
  }
}
