import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freeland/app/profile/presentation/screens/update_career_screen.dart';
import 'package:freeland/common/config/theme/src/colors.dart';
import 'package:freeland/common/widgets/edit_button.dart';
import 'package:freeland/common/widgets/text.dart';
import 'package:go_router/go_router.dart';

class ProfileCareerSection extends StatelessWidget {
  const ProfileCareerSection({Key? key, this.showEdit = false})
      : super(key: key);
  final bool showEdit;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CustomText.headlineSmall("Careers"),
            EditButton(onPressed: () {
              context.pushNamed(CareerUpdateScreen.routeName);
            })
          ],
        ),
        SizedBox(height: 8.0.h),
        Wrap(
          spacing: 12.0.w,
          children: [
            CustomText.bodyLarge("Back End Developping"),
            CustomText.bodyLarge("Dev-Ops Engineer"),
            CustomText.bodyLarge("Text"),
            CustomText.bodyLarge("Chiof technical"),
          ],
        ),
        // ListView.separated(
        //     shrinkWrap: true,
        //     itemCount: 3,
        //     separatorBuilder: (context, index) => SizedBox(height: 10.0.h),
        //     physics: const NeverScrollableScrollPhysics(),
        //     itemBuilder: (context, index) => TimelineTile(
        //           alignment: TimelineAlign.manual,
        //           lineXY: 0.0001,
        //           isFirst: index == 0,
        //           isLast: index == 3,
        //           indicatorStyle: IndicatorStyle(
        //             indicator: const IndicatorTimeLine(),
        //             width: 50.0.r,
        //             height: 50.0.r,
        //           ),
        //           beforeLineStyle: LineStyle(
        //               color: Colors.grey.withOpacity(0.5), thickness: 3.0),
        //           endChild: const CareerInfoWidget(),
        //         )),
      ],
    );
  }
}

class IndicatorTimeLine extends StatelessWidget {
  const IndicatorTimeLine({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: const BoxDecoration(
            shape: BoxShape.circle, color: AppColors.primary),
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: FaIcon(
            FontAwesomeIcons.studiovinari,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
