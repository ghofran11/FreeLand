import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freeland/app/profile/infrastructur/models/my_profile.dart';
import 'package:freeland/app/profile/presentation/widgets/read_more.dart';
import 'package:freeland/app/profile/presentation/widgets/update_add_work.dart';
import 'package:freeland/common/utils/luancher.dart';
import 'package:freeland/common/widgets/edit_button.dart';
import 'package:freeland/common/widgets/text.dart';
import 'package:go_router/go_router.dart';

class PortfolioInfoWidget extends StatelessWidget {
  const PortfolioInfoWidget(
      {Key? key, this.showEdit = false, required this.workDtos})
      : super(key: key);
  final bool showEdit;
  final WorkDtos workDtos;

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText.titleMedium(workDtos.name),
            if (showEdit)
              EditButton(onPressed: () {
                context.pushNamed(AddUpdateWork.routeName);
              })
          ],
        ),
        SizedBox(height: 4.0.h),
        AppReadMore(text: workDtos.description),
        SizedBox(height: 4.0.h),
        InkWell(
          onTap: () => AppLauncher.generalLaunch(workDtos.link),
          child: CustomText.bodyMedium("View Project",
              style: TextStyle(color: themeData.primaryColor)),
        )
      ],
    );
  }
}
