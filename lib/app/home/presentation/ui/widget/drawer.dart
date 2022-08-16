import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freeland/app/auth/presentation/state/app_manager_bloc/app_manager_bloc.dart';
import 'package:freeland/app/profile/presentation/widgets/profile_image.dart';
import 'package:freeland/app/root/common_questions_screen.dart';
import 'package:freeland/app/root/contact_us_screen.dart';
import 'package:freeland/core/user/provider/user_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../../common/config/theme/src/colors.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      child: Column(
        children: [
          TopDrawerWidget(),
          ItemDrawer(
            text: 'Contact Us',
            color: AppColors.green,
            onTap: () {
              context.pushNamed(ContactUsScreen.routeName);
            },
            icon: FontAwesomeIcons.contactBook,
          ),
          ItemDrawer(
            text: 'Common Questions',
            color: AppColors.indigo,
            onTap: () {
              context.pushNamed(CommonQuestionsScreen.routeName);
            },
            icon: FontAwesomeIcons.book,
          ),
          ItemDrawer(
            text: 'Logout',
            color: AppColors.text1,
            onTap: () {
              context.read<AppManagerBloc>().add(const AppManagerLoggedOut());
            },
            icon: Icons.logout,
          ),
        ],
      ),
    );
  }
}

class ItemDrawer extends StatelessWidget {
  const ItemDrawer({
    Key? key,
    this.icon,
    this.onTap,
    required this.text,
    required this.color,
  });

  final IconData? icon;
  final String text;
  final Color color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.2),
          child: Icon(icon, color: color),
        ),
        onTap: onTap,
        title: Text(text,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            )),
      ),
    );
  }
}

class TopDrawerWidget extends StatelessWidget {
  const TopDrawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: SizedBox(
        child: Column(
          children: [
            const ProfileImage(),
            SizedBox(
              height: 12.0.h,
            ),
            Text(
              context.read<UserProvider>().user?.fullName ?? "",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
