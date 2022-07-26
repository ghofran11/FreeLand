import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freeland/app/profile/presentation/screens/all_work_screen.dart';
import 'package:freeland/app/profile/presentation/screens/protofolio_update_screen.dart';
import 'package:freeland/app/profile/presentation/widgets/project_info.dart';
import 'package:freeland/common/widgets/edit_button.dart';
import 'package:freeland/common/widgets/text.dart';
import 'package:go_router/go_router.dart';

class ProfilePortfolioSection extends StatelessWidget {
  const ProfilePortfolioSection({Key? key, this.showEdit = false})
      : super(key: key);
  final bool showEdit;

  @override
  Widget build(BuildContext context) {
    int _itemCount = 3;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CustomText.headlineSmall("Portfolio"),
            if (showEdit)
              EditButton(onPressed: () {
                context.pushNamed(PortfolioUpdateScreen.routeName);
              })
          ],
        ),
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
              onPressed: () {
                context.pushNamed(AllWorkScreen.routeName);
              },
              child: CustomText.bodyMedium("See All",
                  style: TextStyle(color: Theme.of(context).primaryColor)),
            ),
          ),
      ],
    );
  }
}
