import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freeland/common/widgets/text.dart';

class StatisticsWidget extends StatelessWidget {
  final Color color;
  final Widget child;
  final String title;

  const StatisticsWidget({
    Key? key,
    required this.color,
    required this.child,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: color.withOpacity(.3),
          child: Padding(
            padding: EdgeInsets.all(6.0.r),
            child: child,
          ),
          radius: 22.r,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 4.0.h),
          child: CustomText.bodyMedium(title),
        ),
      ],
    );
  }
}
