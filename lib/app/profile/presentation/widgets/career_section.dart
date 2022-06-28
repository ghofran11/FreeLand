import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freeland/app/profile/presentation/widgets/education_info.dart';
import 'package:freeland/common/config/theme/src/colors.dart';
import 'package:freeland/common/widgets/text.dart';
import 'package:timeline_tile/timeline_tile.dart';

class ProfileCareerSection extends StatelessWidget {
  const ProfileCareerSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomText.headlineSmall("Career TimeLine"),
        SizedBox(height: 8.0.h),
        ListView.separated(
            shrinkWrap: true,
            itemCount: 3,
            separatorBuilder: (context, index) => SizedBox(height: 10.0.h),
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => TimelineTile(
                  alignment: TimelineAlign.manual,
                  lineXY: 0.0001,
                  isFirst: index == 0,
                  isLast: index == 3,
                  indicatorStyle: IndicatorStyle(
                    indicator: const IndicatorTimeLine(),
                    width: 50.0.r,
                    height: 50.0.r,
                  ),
                  beforeLineStyle: LineStyle(
                      color: Colors.grey.withOpacity(0.5), thickness: 3.0),
                  endChild: const CareerInfoWidget(),
                )),
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
