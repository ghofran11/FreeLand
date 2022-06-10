import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freeland/app/auth/presentation/login/login_screen.dart';
import 'package:freeland/common/constant/src/keys.dart';
import 'package:freeland/injection/injection.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeScreen extends StatefulWidget {
  static const routePath = '/welcome_screen';

  static Page pageBuilder(BuildContext context, GoRouterState state) {
    return MaterialPage<void>(
      key: state.pageKey,
      child: const WelcomeScreen(),
    );
  }

  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        color: Theme.of(context).colorScheme.primary,
        padding: EdgeInsets.symmetric(horizontal: 100.r, vertical: 50.r),
        child: Center(
          child: Column(
            children: [
              const Text(
                "Default WelcomeScreen",
                style: TextStyle(fontSize: 50),
              ),
              TextButton(
                onPressed: () async {
                  await _updateStorageFlag();
                  context.goNamed(LoginScreen.routeName);
                },
                child: const Text(
                  "To log in ",
                  style: TextStyle(fontSize: 50),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //set flag intro in shared preference as true
  _updateStorageFlag() async {
    await getIt<SharedPreferences>().setBool(kIsFirstOpen, true);
  }
}
