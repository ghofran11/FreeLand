import 'package:colours/colours.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freeland/app/projects/presentation/ui/screen/add_project.dart';
import 'package:freeland/app/projects/presentation/ui/screen/project_own.dart';
import 'package:freeland/app/projects/presentation/ui/screen/working_on.dart';
import 'package:go_router/go_router.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../common/config/theme/src/colors.dart';
import '../../../../common/config/theme/src/styles.dart';
import '../../../../common/widgets/text.dart';

class ProjectPage extends StatelessWidget {
  const ProjectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: ListView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: horizontalAppPadding.w,
          ),
          children: [
            SizedBox(
              height: 10.0.h,
            ),
            Row(
              children: [
                InkWell(
                    onTap: () {},
                    child: const FaIcon(
                      FontAwesomeIcons.barsStaggered,
                      size: 20,
                      color: AppColors.primary,
                    )),
                SizedBox(
                  width: 7.0.w,
                ),
                const CustomText.titleLarge(
                  'Projects',
                  style: TextStyle(color: AppColors.primary),
                ),
              ],
            ),
            SizedBox(
              height: 15.0.h,
            ),
            Row(
              children: const [
                CustomText.titleMedium(
                  'Own project',
                  style: TextStyle(fontSize: 15),
                ),
                Spacer(),
                CustomText.bodySmall("See All",
                    style: TextStyle(color: AppColors.primary))
              ],
            ),
            SizedBox(height: 10.0.h),
            SizedBox(
              height: 250,
              child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(5),
                  separatorBuilder: (context, index) => SizedBox(
                        height: 7.0.h,
                      ),
                  itemCount: 2,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        context.pushNamed(ProjectOwn.routeName);
                      },
                      child: Card(
                        color:Colours.aliceBlue.shade100,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const CustomText.titleMedium('Medical Website'),
                              SizedBox(
                                height: 25.0.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      const CustomText.titleMedium(
                                        '\$ 200-500',
                                        style:
                                            TextStyle(color: AppColors.primary),
                                      ),
                                      SizedBox(
                                        height: 10.0.h,
                                      ),
                                      const CustomText.bodyMedium(
                                        'Salary',
                                        style:
                                            TextStyle(color: AppColors.grey2),
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
                                        style:
                                            TextStyle(color: AppColors.primary),
                                      ),
                                      SizedBox(
                                        height: 10.0.h,
                                      ),
                                      const CustomText.bodyMedium(
                                        'Offer',
                                        style:
                                            TextStyle(color: AppColors.grey2),
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
                                        style:
                                            TextStyle(color: AppColors.primary),
                                      ),
                                      SizedBox(
                                        height: 10.0.h,
                                      ),
                                      const CustomText.bodyMedium(
                                        'Average',
                                        style:
                                            TextStyle(color: AppColors.grey2),
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
            SizedBox(
              height: 30.0.h,
            ),
            Row(
              children: const [
                CustomText.titleMedium(
                  'Working On',
                  style: TextStyle(),
                ),
                Spacer(),
                CustomText.bodySmall(
                  "See All",
                  style: TextStyle(color: AppColors.primary),
                )
              ],
            ),
            SizedBox(height: 5.0.h),
            SizedBox(
              height: 180,
              child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(5),
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) => SizedBox(
                        width: 5.0.w,
                      ),
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        context.pushNamed(WorkingOn.routeName);
                      },
                      child: Card(

                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  CircularPercentIndicator(
                                    radius: 25.0,
                                    lineWidth: 5.0,
                                    percent: 0.7,
                                    center: const Text("75%"),
                                    progressColor: AppColors.green,
                                  ),
                                  SizedBox(width:15.0.w,),
                                const  CustomText.bodyMedium('progress rate',style: TextStyle(color: AppColors.grey2),)
                                ],
                              ),
                              SizedBox(height: 20.0.h,),
                              Column(
                                children: [
                                  const CustomText.titleLarge(
                                      'UI flowers Lab'),
                                  SizedBox(
                                    height: 5.0.h,
                                  ),
                                  const CustomText.titleMedium('Level 2 '),
                                  SizedBox(
                                    height: 5.0.h,
                                  ),
                                  const CustomText.titleMedium('Deadline 15/5'),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
        floatingActionButton: ElevatedButton(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(
                Icons.add,
                color: AppColors.white,
              ),
              Text(
                'project',
                style: TextStyle(color: AppColors.white),
              )
            ],
          ),
          onPressed: () {
            context.pushNamed(AddProject.routeName);
          },
          //  hoverColor: Colors.orange,
        ),
      ),
    );
  }
}
