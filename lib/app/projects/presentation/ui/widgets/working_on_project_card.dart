import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freeland/app/home/infrastructure/models/service.dart';
import 'package:freeland/common/config/theme/src/colors.dart';
import 'package:freeland/common/utils/date_utils.dart';
import 'package:freeland/common/widgets/text.dart';

class WorkingOnProjectCard extends StatelessWidget {
  final ServiceDto project;

  const WorkingOnProjectCard({Key? key, required this.project})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText.titleMedium(project.name,
                style: TextStyle(fontWeight: FontWeight.w500)),
            Row(
              children: [
                const CustomText.bodyMedium(
                  'Progress rate:',
                  style: TextStyle(color: AppColors.grey2),
                ),
                SizedBox(
                  width: 15.0.w,
                ),
                // CircularPercentIndicator(
                //   radius: 25.0,
                //   lineWidth: 3.5,
                //   percent: 0.7,
                //   center: const Text("75%"),
                //   progressColor: AppColors.green,
                // ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 5.0.h,
                ),
                CustomText.titleMedium('Level:  ${project.currentPart ?? 1}'),
                SizedBox(
                  height: 5.0.h,
                ),
                if (project.deadLine != null)
                  Row(
                    children: [
                      const CustomText.titleMedium('Deadline: '),
                      CustomText.titleMedium(
                          AppDateUtils.dateOnly(project.deadLine!),
                          style: const TextStyle(color: Colors.redAccent)),
                    ],
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
