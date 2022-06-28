import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freeland/app/profile/presentation/widgets/read_more.dart';
import 'package:freeland/common/widgets/text.dart';

class PortfolioInfoWidget extends StatelessWidget {
  const PortfolioInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomText.titleMedium("E-commerce App"),
        SizedBox(height: 4.0.h),
        const AppReadMore(
            text:
                'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.'),
        SizedBox(height: 4.0.h),
        InkWell(
          child: CustomText.bodyMedium("View Project",
              style: TextStyle(color: themeData.primaryColor)),
        )
      ],
    );
  }
}
