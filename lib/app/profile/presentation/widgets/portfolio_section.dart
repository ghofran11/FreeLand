import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freeland/app/profile/presentation/widgets/project_info.dart';
import 'package:freeland/common/widgets/text.dart';

class ProfilePortfolioSection extends StatelessWidget {
  const ProfilePortfolioSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int _itemCount = 3;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomText.headlineSmall("Portfolio"),
        SizedBox(height: 8.0.h),
        ListView.separated(
          shrinkWrap: true,
          itemCount: 2,
          separatorBuilder: (context, index) => SizedBox(height: 10.0.h),
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => const PortfolioInfoWidget(),
        ),
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
