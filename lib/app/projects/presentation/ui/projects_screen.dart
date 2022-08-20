import 'package:bot_toast/bot_toast.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:colours/colours.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freeland/app/home/presentation/state/bloc/home_bloc.dart';
import 'package:freeland/app/projects/domain/entities/my_projects.dart';
import 'package:freeland/app/projects/presentation/state/bloc/project_bloc.dart';
import 'package:freeland/app/projects/presentation/state/bloc/project_event.dart';
import 'package:freeland/app/projects/presentation/state/bloc/project_state.dart';
import 'package:freeland/app/projects/presentation/ui/screen/add_project.dart';
import 'package:freeland/app/projects/presentation/ui/screen/all_own_project.dart';
import 'package:freeland/app/projects/presentation/ui/screen/pending_project.dart';
import 'package:freeland/app/projects/presentation/ui/screen/project_own.dart';
import 'package:freeland/app/projects/presentation/ui/screen/working_on.dart';
import 'package:freeland/common/constant/src/strings.dart';
import 'package:freeland/common/widgets/loading_progress.dart';
import 'package:freeland/injection/injection.dart';
import 'package:go_router/go_router.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../common/config/theme/src/colors.dart';
import '../../../../common/config/theme/src/styles.dart';
import '../../../../common/widgets/text.dart';
import 'widgets/posted_project_card.dart';

class ProjectPage extends StatelessWidget {
  const ProjectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProjectBloc>(
      create: (context) => getIt<ProjectBloc>()..add(FetchMyProjects()),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: null,
            title: CustomText.titleLarge('My Projects',
                style: TextStyle(color: Theme.of(context).primaryColor)),
          ),
          body: BlocConsumer<ProjectBloc, ProjectState>(
            listener: (context, state) {
              if (state.fetchMyProjectsStatus.isFail()) {
                BotToast.showText(
                    text: state.fetchMyProjectsStatus.error ??
                        AppStrings.defaultErrorMsg);
              }
            },
            builder: (context, state) {
              if (state.fetchMyProjectsStatus.isSuccess()) {
                final MyProjects myProjects =
                    context.read<ProjectBloc>().myProjects!;
                return ListView(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                      horizontal: horizontalAppPadding.w,
                      vertical: verticalAppPadding.h),
                  children: [
                    Row(
                      children: [
                        const CustomText.titleMedium(
                          'Post projects',
                          style: TextStyle(fontSize: 15),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            context.pushNamed(AllOwnProject.routeName);
                          },
                          child: const CustomText.bodySmall("See All",
                              style: TextStyle(color: AppColors.primary)),
                        )
                      ],
                    ),
                    SizedBox(height: 10.0.h),
                    ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.all(5),
                        separatorBuilder: (context, index) => SizedBox(
                              height: 7.0.h,
                            ),
                        itemCount: myProjects.posted.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return AspectRatio(
                            aspectRatio: 3.0,
                            child: InkWell(
                                onTap: () {
                                  context.pushNamed(ProjectOwn.routeName);
                                },
                                child: PostedProjectCard(
                                  project: myProjects.posted[index],
                                )),
                          );
                        }),
                    SizedBox(
                      height: 16.0.h,
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
                      height: 170,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const CustomText.titleMedium(
                                          'UI flowers Lab',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500)),
                                      Row(
                                        children: [
                                          const CustomText.bodyMedium(
                                            'Progress rate:',
                                            style: TextStyle(
                                                color: AppColors.grey2),
                                          ),
                                          SizedBox(
                                            width: 15.0.w,
                                          ),
                                          CircularPercentIndicator(
                                            radius: 25.0,
                                            lineWidth: 5.0,
                                            percent: index % 2 == 0 ? 0.3 : 0.7,
                                            center: index % 2 == 0
                                                ? const Text("30%")
                                                : const Text("75%"),
                                            progressColor: index % 2 == 0
                                                ? AppColors.yellow
                                                : AppColors.green,
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 5.0.h,
                                          ),
                                          const CustomText.titleMedium(
                                              'Level: 2 '),
                                          SizedBox(
                                            height: 5.0.h,
                                          ),
                                          Row(
                                            children: [
                                              const CustomText.titleMedium(
                                                  'Deadline: '),
                                              CustomText.titleMedium(
                                                  (index % 2 == 0)
                                                      ? '15/5'
                                                      : '17/4',
                                                  style: const TextStyle(
                                                      color: Colors.redAccent)),
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
                          'Pending Project',
                          style: TextStyle(),
                        ),
                        Spacer(),
                        CustomText.bodySmall(
                          "See All",
                          style: TextStyle(color: AppColors.primary),
                        )
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
                                context.pushNamed(PendingProject.routeName);
                              },
                              child: Card(
                                color: Colours.aliceBlue.shade100,
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const CustomText.titleSmall(
                                          'Medical Website'),
                                      SizedBox(
                                        height: 15.0.h,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Column(
                                            children: [
                                              const CustomText.titleMedium(
                                                'ALi sadi',
                                                style: TextStyle(
                                                    color: AppColors.primary,
                                                    fontSize: 14),
                                              ),
                                              SizedBox(
                                                height: 10.0.h,
                                              ),
                                              const CustomText.bodyMedium(
                                                'Freelancer',
                                                style: TextStyle(
                                                    color: AppColors.grey2,
                                                    fontSize: 12),
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
                                                ' \$ 500',
                                                style: TextStyle(
                                                    color: AppColors.primary,
                                                    fontSize: 14),
                                              ),
                                              SizedBox(
                                                height: 10.0.h,
                                              ),
                                              const CustomText.bodyMedium(
                                                'Salary',
                                                style: TextStyle(
                                                    color: AppColors.grey2,
                                                    fontSize: 12),
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
                  ],
                );
              }
              if (state.fetchMyProjectsStatus.isFail()) {
                return const Text("Err");
              }
              return const LoadingProgress();
            },
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
              context.pushNamed(AddProject.routeName,extra:  context.read<HomeBloc>().categories);
            },
            //  hoverColor: Colors.orange,
          ),
        ),
      ),
    );
  }
}
