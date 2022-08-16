import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freeland/app/profile/infrastructur/models/my_profile.dart';
import 'package:freeland/app/profile/presentation/screens/all_work_screen.dart';
import 'package:freeland/app/profile/presentation/screens/protofolio_update_screen.dart';
import 'package:freeland/app/profile/presentation/widgets/project_info.dart';
import 'package:freeland/common/widgets/edit_button.dart';
import 'package:freeland/common/widgets/text.dart';
import 'package:go_router/go_router.dart';

class ProfilePortfolioSection extends StatelessWidget {
  ProfilePortfolioSection({Key? key, this.isMe = false, required this.works})
      : super(key: key);
  final bool isMe;
  List<WorkDtos> works;

  @override
  Widget build(BuildContext context) {
    int _itemCount = min(works.length, 3);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CustomText.headlineSmall("Portfolio"),
            if (isMe)
              EditButton(onPressed: () {
                context.pushNamed(PortfolioUpdateScreen.routeName,
                    extra: works);
              })
          ],
        ),
        SizedBox(height: 8.0.h),
        if (_itemCount > 0)
          ListView.separated(
            shrinkWrap: true,
            itemCount: _itemCount,
            separatorBuilder: (context, index) => SizedBox(height: 10.0.h),
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => PortfolioInfoWidget(
              workDtos: works[index],
              showEdit: false,
            ),
          ),
        if (_itemCount == 0)
          CustomText.bodyMedium('No Portfolio Work Yet',
              style: TextStyle(color: Theme.of(context).primaryColor)),
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
