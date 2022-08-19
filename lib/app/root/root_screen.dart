import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freeland/app/home/presentation/state/bloc/home_bloc.dart';
import 'package:freeland/app/home/presentation/ui/screen/home_screen.dart';
import 'package:freeland/app/notifications/presentation/notifications_page.dart';
import 'package:freeland/app/profile/personal_profile_page.dart';
import 'package:freeland/app/projects/presentation/ui/projects_screen.dart';
import 'package:freeland/app/root/state/navigation_bar_provider.dart';
import 'package:freeland/common/config/theme/src/colors.dart';
import 'package:freeland/common/widgets/text.dart';
import 'package:freeland/injection/injection.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class RootScreen extends StatelessWidget {
  RootScreen({Key? key}) : super(key: key);

  static Page pageBuilder(BuildContext context, GoRouterState state) {
    return MaterialPage<void>(
      key: state.pageKey,
      child: RootScreen(),
    );
  }

  static const routePath = '/root';
  static const routeName = '/root';

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [

        BlocProvider<HomeBloc>(
          create: (_) => getIt<HomeBloc>()
            ..add(FetchAllCategory())
            ..add(FetchAllUser()),
        ),
      ],
      child: Consumer<BottomNavigationProvider>(
        builder: (_, provider, ___) {
          return Scaffold(
            bottomNavigationBar: BottomNavyBar(
              iconSize: 20.r,
              selectedIndex: provider.index,
              showElevation: true,
              backgroundColor: AppColors.background,
              onItemSelected: (index) {
                provider.index = index;
              },
              items: [
                BottomNavyBarItem(
                  icon: const FaIcon(
                    FontAwesomeIcons.house,
                  ),
                  inactiveColor: AppColors.borderColor,
                  title: const CustomText.bodySmall("Home"),
                  textAlign: TextAlign.center,
                ),
                BottomNavyBarItem(
                  icon: const FaIcon(
                    FontAwesomeIcons.solidBell,
                  ),
                  inactiveColor: AppColors.borderColor,
                  textAlign: TextAlign.center,
                  title: const CustomText.bodySmall("Notifications"),
                ),
                BottomNavyBarItem(
                  inactiveColor: AppColors.borderColor,
                  icon: const FaIcon(
                    FontAwesomeIcons.bookOpen,
                  ),
                  textAlign: TextAlign.center,
                  title: const CustomText.bodySmall("Projects"),
                ),
                BottomNavyBarItem(
                  icon: const FaIcon(
                    FontAwesomeIcons.solidUser,
                  ),
                  inactiveColor: AppColors.borderColor,
                  textAlign: TextAlign.center,
                  title: const CustomText.bodySmall("Profile"),
                ),
              ],
            ),
            body: SafeArea(
              child: PageView(
                  controller: provider.pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    HomePage(),
                    NotificationsPage(),
                    const ProjectPage(),
                    const PersonalProfilePage(),
                  ]),
            ),
          );
        },
      ),
    );
  }
}
