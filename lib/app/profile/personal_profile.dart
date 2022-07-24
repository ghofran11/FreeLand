import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freeland/app/profile/presentation/widgets/career_section.dart';
import 'package:freeland/app/profile/presentation/widgets/education_section.dart';
import 'package:freeland/app/profile/presentation/widgets/portfolio_section.dart';
import 'package:freeland/app/profile/presentation/widgets/projects_section.dart';
import 'package:freeland/common/config/theme/src/colors.dart';
import 'package:freeland/common/config/theme/src/styles.dart';
import 'package:freeland/common/widgets/text.dart';
import 'package:go_router/go_router.dart';

import '../../common/widgets/statistics_widget.dart';
import 'presentation/personal_info_update_screen.dart';
import 'presentation/widgets/profile_image.dart';

class PersonalProfile extends StatelessWidget {
  const PersonalProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(
          vertical: verticalAppPadding.h, horizontal: horizontalAppPadding.w),
      children: [
        // ImageHolder(onUpdateImage: (image) {}, onDeleteImage: () {}),
        ProfileImage(),
        Padding(
          padding: EdgeInsets.all(8.0.r),
          child: const CustomText.titleLarge(
            "Ahmed Ahmed",
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0.r),
          child: const CustomText.bodyLarge(
            "I am Creative Ui-Ux designer and this is my Awesome great Bio",
            textAlign: TextAlign.center,
          ),
        ),
        ElevatedButton(
            onPressed: () {
              context.pushNamed(PersonalInfoUpdate.routeName);
            },
            child: CustomText.bodyMedium(
              "Edit profile",
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
            )),
        SizedBox(
          height: 8.0.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            StatisticsWidget(
              color: AppColors.green,
              child: FaIcon(
                FontAwesomeIcons.listCheck,
                color: AppColors.green,
              ),
              title: "4",
            ),
            StatisticsWidget(
              color: AppColors.blueAccent2,
              child: FaIcon(
                FontAwesomeIcons.solidCircleUser,
                color: AppColors.blueAccent2,
              ),
              title: "300",
            ),
            StatisticsWidget(
              color: AppColors.yellow,
              child: FaIcon(
                FontAwesomeIcons.solidStar,
                color: AppColors.yellow,
              ),
              title: "3.4",
            ),
          ],
        ),
        Wrap(
          spacing: 4.0.w,
          alignment: WrapAlignment.center,
          children: const [
            Chip(
              label: Text("Ui-Ux"),
            ),
            Chip(
              label: Text("Designing"),
            ),
            Chip(
              label: Text("TTTTT"),
            ),
            Chip(
              label: Text("Front End"),
            ),
            Chip(
              label: Text("Ui-Ux"),
            ),
            Chip(
              label: Text("Ui-Ux"),
            ),
          ],
        ),
        SizedBox(
          height: 12.0.h,
        ),
        const ProfileProjectsSection(
          showEdit: true,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 12.0.h),
          child: const Divider(color: AppColors.black),
        ),
        const ProfilePortfolioSection(),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 12.0.h),
          child: const Divider(color: AppColors.black),
        ),
        const ProfileCareerSection(),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 12.0.h),
          child: const Divider(color: AppColors.black),
        ),
        const ProfileEducationSection(),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 12.0.h),
          child: const Divider(color: AppColors.black),
        ),
      ],
    );
  }
}
