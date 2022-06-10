import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:freeland/common/config/theme/src/colors.dart';
import 'package:go_router/go_router.dart';

import '../widget/drawer.dart';

final ZoomDrawerController zoomDrawerController = ZoomDrawerController();

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static Page pageBuilder(BuildContext context, GoRouterState state) {
    return MaterialPage<void>(
      key: state.pageKey,
      child: const HomeScreen(),
    );
  }

  static const routePath = '/home';
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: ZoomDrawer(
        drawerShadowsBackgroundColor: Colors.grey.shade300,
        clipMainScreen: true,
        menuScreenWidth: 320,
        shrinkMainScreen: false,
        controller: zoomDrawerController,
        borderRadius: 24,
        angle: -0.0,
        style: DrawerStyle.defaultStyle,
        showShadow: false,
        isRtl: true,
        menuBackgroundColor: AppColors.purple,
        slideWidth: MediaQuery.of(context).size.width * 0.65,
        duration: const Duration(milliseconds: 500),
        mainScreen: const HomeScreenWidget(),
        menuScreen: const DrawerScreen(),
      )),
    );
  }
}

class HomeScreenWidget extends StatelessWidget {
  const HomeScreenWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Home"),
    );
  }
}
