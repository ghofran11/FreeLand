import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../common/config/theme/src/colors.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
            width: double.infinity,
            padding: EdgeInsets.only(right: 24),
            decoration: const BoxDecoration(color: AppColors.purple),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              children: [
                const TopDrawerWidget(),
                Expanded(
                    child: ListView(
                  children: [
                    // ItemDrawer(
                    //   asset: Assets.iconsClass_icon,
                    //   text: 'الصفوف',
                    //   routeName: "ClassScreen.routeName",
                    // ),
                  ],
                )),
                SizedBox(
                  height: 50,
                ),
              ],
            )),
      ),
    );
  }
}

class ItemDrawer extends StatelessWidget {
  const ItemDrawer({
    Key? key,
    this.asset,
    this.child,
    required this.routeName,
    this.onTap,
    required this.text,
  })  : assert(child != null || asset != null),
        super(key: key);
  final String? asset;
  final Icon? child;
  final String text;
  final String routeName;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: AppColors.white,
          child: child ?? SvgPicture.asset(asset!),
        ),
        onTap: onTap,
        title: Text(text,
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.white)),
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
        height: 100,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            // const CircleAvatarPerson(radius: 35),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'مجتهد سعيد',
                  style: TextStyle(
                      color: AppColors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'عرض الملف الشخصي',
                    style: TextStyle(
                        color: AppColors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
