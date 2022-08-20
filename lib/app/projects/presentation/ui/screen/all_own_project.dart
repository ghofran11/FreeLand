import 'package:colours/colours.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freeland/app/projects/presentation/ui/screen/project_own.dart';
import 'package:freeland/common/config/theme/src/colors.dart';
import 'package:freeland/common/config/theme/src/styles.dart';
import 'package:freeland/common/widgets/text.dart';
import 'package:go_router/go_router.dart';

class AllOwnProject extends StatelessWidget {
  const AllOwnProject({Key? key}) : super(key: key);

  static Page pageBuilder(BuildContext context, GoRouterState state) {
    return MaterialPage<void>(
      key: state.pageKey,
      child: const AllOwnProject(),
    );
  }

  static const routePath = 'all_own_project';
  static const routeName = 'all_own_project';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                context.pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: AppColors.primary,
              )),
          title: CustomText.titleLarge('My Posted Projects',
              style: TextStyle(color: Theme.of(context).primaryColor)),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: horizontalAppPadding.w,
              vertical: verticalAppPadding.h),
          child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(5),
              separatorBuilder: (context, index) => SizedBox(
                    height: 7.0.h,
                  ),
              itemCount: 20,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    context.pushNamed(ProjectOwn.routeName);
                  },
                  child: Card(
                    color: Colours.aliceBlue.shade100,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomText.titleSmall('Medical Website'),
                          SizedBox(
                            height: 15.0.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  const CustomText.titleMedium(
                                    '\$ 200-500',
                                    style: TextStyle(
                                        color: AppColors.primary, fontSize: 14),
                                  ),
                                  SizedBox(
                                    height: 10.0.h,
                                  ),
                                  const CustomText.bodyMedium(
                                    'Salary',
                                    style: TextStyle(
                                        color: AppColors.grey2, fontSize: 12),
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
                                  const CustomText.titleMedium(
                                    ' 15',
                                    style: TextStyle(
                                        color: AppColors.primary, fontSize: 14),
                                  ),
                                  SizedBox(
                                    height: 10.0.h,
                                  ),
                                  const CustomText.bodyMedium(
                                    'Offer',
                                    style: TextStyle(
                                        color: AppColors.grey2, fontSize: 12),
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
                                    style: TextStyle(
                                        color: AppColors.primary, fontSize: 14),
                                  ),
                                  SizedBox(
                                    height: 10.0.h,
                                  ),
                                  const CustomText.bodyMedium(
                                    'Average',
                                    style: TextStyle(
                                        color: AppColors.grey2, fontSize: 12),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
