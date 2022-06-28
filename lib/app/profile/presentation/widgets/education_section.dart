import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freeland/app/profile/presentation/widgets/career_info.dart';
import 'package:freeland/common/widgets/text.dart';

class ProfileEducationSection extends StatelessWidget {
  const ProfileEducationSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int _itemCount = 3;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomText.headlineSmall("Education"),
        SizedBox(height: 8.0.h),
        ListView.separated(
          shrinkWrap: true,
          itemCount: 2,
          separatorBuilder: (context, index) => SizedBox(height: 10.0.h),
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => const EducationInfoWidget(),
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
