import 'package:flutter/material.dart';
import 'package:freeland/common/widgets/text.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatelessWidget {
  static const routePath = '/';

  static Page pageBuilder(BuildContext context, GoRouterState state) {
    return MaterialPage<void>(
      key: state.pageKey,
      child: const SplashScreen(),
    );
  }

  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: CustomText.headlineLarge(
          "FreeLand! 😎",
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ),
    );
  }
}
