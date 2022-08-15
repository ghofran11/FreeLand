import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freeland/app/home/presentation/ui/screen/home_screen.dart';
import 'package:freeland/app/notifications/presentation/notifications_page.dart';
import 'package:freeland/app/profile/personal_profile_page.dart';
import 'package:freeland/app/projects/presentation/ui/projects_screen.dart';
import 'package:freeland/common/widgets/text.dart';
import 'package:go_router/go_router.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  static Page pageBuilder(BuildContext context, GoRouterState state) {
    return MaterialPage<void>(
      key: state.pageKey,
      child: const RootScreen(),
    );
  }

  static const routePath = '/root';
  static const routeName = '/root';

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int _selectedIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   actions: [
      //     IconButton(
      //         onPressed: () {
      //           context.read<AppManagerBloc>().add(const AppManagerLoggedOut());
      //         },
      //         icon: const FaIcon(FontAwesomeIcons.infinity))
      //   ],
      // ),
      bottomNavigationBar: BottomNavyBar(
        iconSize: 20.r,

        selectedIndex: _selectedIndex,
        showElevation: true,
        // use this to remove appBar's elevation
        onItemSelected: (index) => setState(() {
          _selectedIndex = index;
          _pageController.animateToPage(index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn);
        }),
        items: [
          BottomNavyBarItem(
            icon: const FaIcon(
              FontAwesomeIcons.house,
            ),
            title: const CustomText.bodySmall("Home"),
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: const FaIcon(
              FontAwesomeIcons.solidBell,
            ),
            textAlign: TextAlign.center,
            title: const CustomText.bodySmall("Notifications"),
          ),
          BottomNavyBarItem(
            icon: const FaIcon(
              FontAwesomeIcons.solidUser,
            ),
            textAlign: TextAlign.center,
            title: const CustomText.bodySmall("Profile"),
          ),
          BottomNavyBarItem(
            icon: const FaIcon(
              FontAwesomeIcons.bookOpen,
            ),
            textAlign: TextAlign.center,
            title: const CustomText.bodySmall("Projects"),
          ),
        ],
      ),
      body: SafeArea(
        child: PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              const HomePage(),
              NotificationsPage(),
              const PersonalProfilePage(),
              const ProjectPage()
            ]),
      ),
    );
  }
}
