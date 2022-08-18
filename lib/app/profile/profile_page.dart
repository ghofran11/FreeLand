import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freeland/app/profile/presentation/state/profile_bloc/profile_bloc.dart';
import 'package:freeland/common/config/theme/src/colors.dart';
import 'package:freeland/common/config/theme/src/styles.dart';
import 'package:freeland/common/constant/constants.dart';
import 'package:freeland/common/widgets/loading_progress.dart';
import 'package:freeland/common/widgets/text.dart';
import 'package:freeland/injection/injection.dart';
import 'package:go_router/go_router.dart';

import '../../common/widgets/statistics_widget.dart';
import 'presentation/widgets/career_section.dart';
import 'presentation/widgets/education_section.dart';
import 'presentation/widgets/portfolio_section.dart';
import 'presentation/widgets/profile_image.dart';
import 'presentation/widgets/projects_section.dart';

class ProfilePage extends StatelessWidget {
  final String id;

  const ProfilePage({Key? key, required this.id}) : super(key: key);

  static Page pageBuilder(BuildContext context, GoRouterState state) {
    return MaterialPage<void>(
      key: state.pageKey,
      child: ProfilePage(
        id: state.extra as String,
      ),
    );
  }

  static const routePath = 'profile_page';
  static const routeName = 'profile_page';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileBloc>(
        create: (context) =>
            getIt<ProfileBloc>()..add(AnotherProfileFetched(id)),
        child: Scaffold(
          body: BlocConsumer<ProfileBloc, ProfileState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              if (state.profileStatus.isSuccess()) {
                return Scaffold(
                    appBar: AppBar(
                      leading: IconButton(
                          onPressed: () {
                            context.pop();
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: AppColors.primary,
                          )),
                    ),
                    body: Builder(
                      builder: (context) {
                        final profile = state.profile!;
                        if (state.profileStatus.isSuccess()) {
                          return ListView(
                            physics: const BouncingScrollPhysics(),
                            padding: EdgeInsets.symmetric(
                                vertical: verticalAppPadding.h,
                                horizontal: horizontalAppPadding.w),
                            children: [
                              const ProfileImage(),
                              Padding(
                                padding: EdgeInsets.all(8.0.r),
                                child: CustomText.titleLarge(
                                  profile.fullName,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              if (profile.bio != null)
                                Padding(
                                  padding: EdgeInsets.all(8.0.r),
                                  child: CustomText.bodyLarge(
                                    profile.bio!,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ElevatedButton(
                                  onPressed: () {
                                    //ToDo:
                                  },
                                  child: CustomText.bodyMedium(
                                    "Connect",
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimary),
                                  )),
                              SizedBox(
                                height: 8.0.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  StatisticsWidget(
                                    color: AppColors.green,
                                    child: FaIcon(
                                      FontAwesomeIcons.listCheck,
                                      color: AppColors.green,
                                    ),
                                    title: profile.numOfCompletedProjects
                                        .toString(),
                                  ),
                                  StatisticsWidget(
                                    color: AppColors.blueAccent2,
                                    child: FaIcon(
                                      FontAwesomeIcons.solidCircleUser,
                                      color: AppColors.blueAccent2,
                                    ),
                                    title: profile.numOfCompletedProjects
                                        .toString(),
                                  ),
                                  StatisticsWidget(
                                    color: AppColors.yellow,
                                    child: FaIcon(
                                      FontAwesomeIcons.solidStar,
                                      color: AppColors.yellow,
                                    ),
                                    title: profile.evalution.toString(),
                                  ),
                                ],
                              ),
                              Wrap(
                                  spacing: 4.0.w,
                                  alignment: WrapAlignment.center,
                                  children: List.generate(
                                    state.profile!.careerDtos.length,
                                    (index) => Chip(
                                      label: CustomText.bodyMedium(state
                                          .profile!.careerDtos[index].name),
                                    ),
                                  )),
                              SizedBox(
                                height: 12.0.h,
                              ),
                              ProfileProjectsSection(
                                services: profile.serviceDtos,
                                isMe: false,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 12.0.h),
                                child: const Divider(color: AppColors.black),
                              ),
                              ProfilePortfolioSection(
                                works: profile.workDtos,
                                isMe: false,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 12.0.h),
                                child: const Divider(color: AppColors.black),
                              ),
                              ProfileCareerSection(
                                careers: profile.careerDtos,
                                isMe: false,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 12.0.h),
                                child: const Divider(color: AppColors.black),
                              ),
                              ProfileEducationSection(
                                isMe: false,
                                courses: profile.educationDtos,
                              ),
                            ],
                          );
                        }
                        if (state.profileStatus.isFail()) {
                          return Text(state.profileStatus.error ??
                              AppStrings.defaultErrorMsg);
                        }
                        return const LoadingProgress();
                      },
                    ));
              }

              if (state.profileStatus.isFail()) {
                return Text(
                    state.profileStatus.error ?? AppStrings.defaultErrorMsg);
              }

              return const LoadingProgress();
            },
          ),
        ));
  }
}
