import 'dart:math';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../common/config/theme/src/colors.dart';
import '../../../../common/config/theme/src/styles.dart';
import '../../../../common/widgets/text.dart';
import 'widgets/pending_project_card.dart';
import 'widgets/posted_project_card.dart';
import 'widgets/working_on_project_card.dart';

class ProjectPage extends StatelessWidget {
  ProjectPage({Key? key}) : super(key: key);
  final _refreshController = RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProjectBloc>(
      create: (context) => getIt<ProjectBloc>()..add(FetchMyProjects()),
      child: Builder(
        builder: (context) {
          return SafeArea(
            child: SmartRefresher(
              controller: _refreshController,
              onRefresh: () {
                context.read<ProjectBloc>().add(FetchMyProjects());
              },
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
                    if (!state.fetchMyProjectsStatus.isLoading()) {
                      _refreshController.refreshCompleted();
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
                                'Posted projects',
                                style: TextStyle(fontSize: 15),
                              ),
                              const Spacer(),
                              if (myProjects.posted.isNotEmpty)
                                InkWell(
                                  onTap: () {
                                    context.pushNamed(AllOwnProject.routeName,
                                        extra: myProjects.posted);
                                  },
                                  child: const CustomText.bodySmall("See All",
                                      style:
                                          TextStyle(color: AppColors.primary)),
                                )
                            ],
                          ),
                          SizedBox(height: 10.0.h),
                          myProjects.posted.isNotEmpty
                              ? ListView.separated(
                                  physics: const BouncingScrollPhysics(),
                                  padding: const EdgeInsets.all(5),
                                  separatorBuilder: (context, index) =>
                                      SizedBox(
                                        height: 7.0.h,
                                      ),
                                  itemCount: min(myProjects.posted.length, 2),
                                  shrinkWrap: true,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return AspectRatio(
                                      aspectRatio: 3.0,
                                      child: InkWell(
                                          onTap: () {
                                            context.pushNamed(
                                                ProjectOwn.routeName,extra: myProjects.posted[index].id);
                                          },
                                          child: PostedProjectCard(
                                            project: myProjects.posted[index],
                                          )),
                                    );
                                  })
                              : const CustomText.bodyMedium(
                                  'No posted projects yet'),
                          SizedBox(
                            height: 16.0.h,
                          ),
                          const CustomText.titleMedium(
                            'Working On',
                          ),
                          SizedBox(height: 5.0.h),
                          myProjects.working.isNotEmpty
                              ? SizedBox(
                                  height: 150.0.h,
                                  child: ListView.separated(
                                      physics: const BouncingScrollPhysics(),
                                      padding: const EdgeInsets.all(5),
                                      scrollDirection: Axis.horizontal,
                                      separatorBuilder: (context, index) =>
                                          SizedBox(
                                            width: 5.0.w,
                                          ),
                                      shrinkWrap: true,
                                      itemCount: myProjects.working.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return InkWell(
                                            onTap: () {
                                              context.pushNamed(
                                                  WorkingOn.routeName);
                                            },
                                            child: WorkingOnProjectCard(
                                              project:
                                                  myProjects.working[index],
                                            ));
                                      }),
                                )
                              : const CustomText.bodyMedium(
                                  'No Working on projects now'),
                          SizedBox(
                            height: 30.0.h,
                          ),
                          const CustomText.titleMedium('Pending Project'),
                          SizedBox(height: 10.0.h),
                          myProjects.pending.isNotEmpty
                              ? ListView.separated(
                                  physics: const BouncingScrollPhysics(),
                                  padding: const EdgeInsets.all(5),
                                  separatorBuilder: (context, index) =>
                                      SizedBox(
                                        height: 7.0.h,
                                      ),
                                  itemCount: min(myProjects.pending.length, 2),
                                  shrinkWrap: true,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return AspectRatio(
                                      aspectRatio: 3.0,
                                      child: InkWell(
                                          onTap: () {
                                            context.pushNamed(
                                                PendingProject.routeName);
                                          },
                                          child: PendingProjectCard(
                                            project: myProjects.pending[index],
                                          )),
                                    );
                                  })
                              : const CustomText.bodyMedium(
                                  'No pending  projects now'),
                          SizedBox(height: 50.0.h),
                        ],
                      );
                    }
                    if (state.fetchMyProjectsStatus.isFail()) {
                      return Text(state.fetchMyProjectsStatus.error ??
                          AppStrings.defaultErrorMsg);
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
                    context.pushNamed(AddProject.routeName,
                        extra: context.read<HomeBloc>().categories);
                  },
                  //  hoverColor: Colors.orange,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
