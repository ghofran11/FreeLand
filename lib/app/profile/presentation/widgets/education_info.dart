import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freeland/common/widgets/text.dart';

class CareerInfoWidget extends StatelessWidget {
  const CareerInfoWidget({Key? key}) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomText.bodyLarge("BackEnd developer"),
        SizedBox(height: 4.0.h),
        const CustomText.bodyLarge("Goodle"),
        SizedBox(height: 4.0.h),
        CustomText.bodyMedium("2012 - 2015",
            style: TextStyle(color: themeData.disabledColor)),
      ],
    );
  }
}
