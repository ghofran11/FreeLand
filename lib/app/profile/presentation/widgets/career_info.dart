import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freeland/app/profile/infrastructur/models/my_profile.dart';
import 'package:freeland/common/widgets/text.dart';

class EducationInfoWidget extends StatelessWidget {
  const EducationInfoWidget({Key? key, required this.course}) : super(key: key);
  final EducationDtos course;
  @override
  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText.bodyLarge(course.name),
        SizedBox(height: 4.0.h),
        const CustomText.bodyLarge(
            "Bachelor's Degree - informatics Engineering "),
        SizedBox(height: 4.0.h),
        CustomText.bodyMedium(
            "${course.startDate.year} - ${course.graduationDate.year}",
            style: TextStyle(color: themeData.disabledColor)),
      ],
    );
  }
}
