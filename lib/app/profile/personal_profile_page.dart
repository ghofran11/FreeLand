import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freeland/app/profile/presentation/screens/connection_screen.dart';
import 'package:freeland/app/profile/presentation/widgets/career_section.dart';
import 'package:freeland/app/profile/presentation/widgets/education_section.dart';
import 'package:freeland/app/profile/presentation/widgets/portfolio_section.dart';
import 'package:freeland/app/profile/presentation/widgets/projects_section.dart';
import 'package:freeland/common/config/theme/src/colors.dart';
import 'package:freeland/common/config/theme/src/styles.dart';
import 'package:freeland/common/constant/constants.dart';
import 'package:freeland/common/widgets/loading_progress.dart';
import 'package:freeland/common/widgets/text.dart';
import 'package:go_router/go_router.dart';

import '../../common/widgets/statistics_widget.dart';
import 'presentation/screens/personal_info_update_screen.dart';
import 'presentation/state/my_proflile_bloc/my_profile_bloc.dart';
import 'presentation/widgets/profile_image.dart';

class PersonalProfilePage extends StatefulWidget {
  const PersonalProfilePage({Key? key}) : super(key: key);

  static Page pageBuilder(BuildContext context, GoRouterState state) {
    return MaterialPage<void>(
      key: state.pageKey,
      child: const PersonalProfilePage(),
    );
  }

  static const routePath = 'PersonalProfilePage';
  static const routeName = 'PersonalProfilePage';

  @override
  State<PersonalProfilePage> createState() => _PersonalProfilePageState();
}

class _PersonalProfilePageState extends State<PersonalProfilePage> {
  @override
  Widget build(BuildContext context) {
    final myProfileBloc = context.read<MyProfileBloc>();
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
      body: BlocConsumer<MyProfileBloc, MyProfileState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state.profileStatus.isSuccess()) {
            return ListView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(
                  vertical: verticalAppPadding.h,
                  horizontal: horizontalAppPadding.w),
              children: [
                // ImageHolder(onUpdateImage: (image) {}, onDeleteImage: () {}),
                const ProfileImage(
                    //ToDo
                    // image: state.profile.,
                    ),
                Padding(
                  padding: EdgeInsets.all(8.0.r),
                  child: CustomText.titleLarge(
                    state.profile!.fullName,
                    textAlign: TextAlign.center,
                  ),
                ),
                if (state.profile!.bio != null)
                  Padding(
                    padding: EdgeInsets.all(8.0.r),
                    child: CustomText.bodyLarge(
                      state.profile!.bio!,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ElevatedButton(
                    onPressed: () {
                      context.pushNamed(PersonalInfoUpdate.routeName);
                    },
                    child: CustomText.bodyMedium(
                      "Edit profile",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary),
                    )),
                SizedBox(
                  height: 8.0.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    StatisticsWidget(
                      color: AppColors.green,
                      child: const FaIcon(
                        FontAwesomeIcons.listCheck,
                        color: AppColors.green,
                      ),
                      title: state.profile!.numOfCompletedProjects.toString(),
                    ),
                    InkWell(
                      child: StatisticsWidget(
                        color: AppColors.blueAccent2,
                        child: const FaIcon(
                          FontAwesomeIcons.solidCircleUser,
                          color: AppColors.blueAccent2,
                        ),
                        title: state.profile!.numOfConnections.toString(),
                      ),
                      onTap: (){
                        print('ghofran ghofran ');
                        context.pushNamed(ConnectionScreen.routeName,extra: state.profile!.connectedUsers);
                      },
                    ),
                    StatisticsWidget(
                      color: AppColors.yellow,
                      child: const FaIcon(
                        FontAwesomeIcons.solidStar,
                        color: AppColors.yellow,
                      ),
                      title: state.profile!.evalution.toString(),
                    ),
                  ],
                ),
                Wrap(
                    spacing: 4.0.w,
                    alignment: WrapAlignment.center,
                    children: List.generate(
                      state.profile!.careerDtos.length,
                      (index) => Chip(
                        label: CustomText.bodyMedium(
                            state.profile!.careerDtos[index].name),
                      ),
                    )),
                SizedBox(
                  height: 12.0.h,
                ),
                ProfileProjectsSection(
                  services: state.profile!.serviceDtos,
                  isMe: true,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0.h),
                  child: const Divider(color: AppColors.black),
                ),
                ProfilePortfolioSection(
                  works: state.profile!.workDtos,
                  isMe: true,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0.h),
                  child: const Divider(color: AppColors.black),
                ),
                ProfileCareerSection(
                  careers: state.profile!.careerDtos,
                  isMe: true,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0.h),
                  child: const Divider(color: AppColors.black),
                ),
                ProfileEducationSection(
                  isMe: true,
                  courses: state.profile!.educationDtos,
                ),
              ],
            );
          }

          if (state.profileStatus.isFail()) {
            return Text(
                state.profileStatus.error ?? AppStrings.defaultErrorMsg);
          }

          return const LoadingProgress();
        },
      ),
    );
  }
}
