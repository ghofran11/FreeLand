import 'package:colours/colours.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freeland/app/home/infrastructure/models/service.dart';
import 'package:freeland/common/config/theme/src/colors.dart';
import 'package:freeland/common/widgets/currency_symbo.dart';
import 'package:freeland/common/widgets/text.dart';

class PostedProjectCard extends StatelessWidget {
  final ServiceDto project;

  const PostedProjectCard({Key? key, required this.project}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colours.aliceBlue.shade100,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText.titleSmall(project.name),
            SizedBox(
              height: 15.0.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        const CurrencySymbol(),
                        CustomText.titleMedium(
                          '${project.minPrice}-${project.maxPrice}',
                          style: const TextStyle(
                              color: AppColors.primary, fontSize: 14),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.0.h,
                    ),
                    const CustomText.bodyMedium(
                      'Budget',
                      style: TextStyle(color: AppColors.grey2, fontSize: 12),
                    ),
                  ],
                ),
                SizedBox(
                    height: 40.0.h,
                    child: const VerticalDivider(
                      color: AppColors.grey2,
                    )),
                Column(
                  children: [
                    //ToDo:
                    const CustomText.titleMedium(
                      ' 15',
                      style: TextStyle(color: AppColors.primary, fontSize: 14),
                    ),
                    SizedBox(
                      height: 10.0.h,
                    ),
                    const CustomText.bodyMedium(
                      'Offer',
                      style: TextStyle(color: AppColors.grey2, fontSize: 12),
                    ),
                  ],
                ),
                SizedBox(
                    height: 20.0.h,
                    child: const VerticalDivider(
                      color: AppColors.grey2,
                    )),
                Column(
                  children: [
                    const CustomText.titleMedium(
                      '\$ 200',
                      style: TextStyle(color: AppColors.primary, fontSize: 14),
                    ),
                    SizedBox(
                      height: 10.0.h,
                    ),
                    const CustomText.bodyMedium(
                      'Average',
                      style: TextStyle(color: AppColors.grey2, fontSize: 12),
                    ),
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
