import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freeland/app/profile/infrastructur/models/my_profile.dart';
import 'package:freeland/app/profile/presentation/widgets/career_info.dart';
import 'package:freeland/common/widgets/edit_button.dart';
import 'package:freeland/common/widgets/text.dart';

class ProfileEducationSection extends StatelessWidget {
  const ProfileEducationSection(
      {Key? key, this.isMe = false, required this.courses})
      : super(key: key);
  final bool isMe;
  final List<EducationDtos> courses;

  @override
  Widget build(BuildContext context) {
    int _itemCount = min(2, courses.length);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CustomText.headlineSmall("Education"),
            if (isMe)
              EditButton(onPressed: () {
                // context.pushNamed(
                //   CareerUpdateScreen.routeName,
                // );
              })
          ],
        ),
        SizedBox(height: 8.0.h),
        if (courses.isNotEmpty)
          ListView.separated(
            shrinkWrap: true,
            itemCount: _itemCount,
            separatorBuilder: (context, index) => SizedBox(height: 10.0.h),
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => EducationInfoWidget(
              course: courses[index],
            ),
          ),
        if (courses.isEmpty)
          CustomText.bodyMedium('No Education Yet',
              style: TextStyle(color: Theme.of(context).primaryColor)),
        if (_itemCount > 2)
          Center(
            child: TextButton(
              onPressed: () {},
              child: CustomText.bodyMedium("See All",
                  style: TextStyle(color: Theme.of(context).primaryColor)),
            ),
          ),
      ],
    );
  }
}
