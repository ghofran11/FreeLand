import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freeland/common/widgets/text.dart';

class EducationInfoWidget extends StatelessWidget {
  const EducationInfoWidget({Key? key}) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomText.bodyLarge("IT , Aleppo University"),
        SizedBox(height: 4.0.h),
        const CustomText.bodyLarge(
            "Bachelor's Degree - informatics Engineering "),
        SizedBox(height: 4.0.h),
        CustomText.bodyMedium("2012 - 2015",
            style: TextStyle(color: themeData.disabledColor)),
      ],
    );
  }
}
