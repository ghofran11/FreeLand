import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freeland/app/home/infrastructure/models/service.dart';
import 'package:freeland/app/projects/presentation/ui/screen/project_own.dart';
import 'package:freeland/app/projects/presentation/ui/widgets/posted_project_card.dart';
import 'package:freeland/common/config/theme/src/colors.dart';
import 'package:freeland/common/config/theme/src/styles.dart';
import 'package:freeland/common/widgets/text.dart';
import 'package:go_router/go_router.dart';

class AllOwnProject extends StatelessWidget {
  const AllOwnProject({Key? key, required this.projects}) : super(key: key);
  final List<ServiceDto> projects;

  static Page pageBuilder(BuildContext context, GoRouterState state) {
    return MaterialPage<void>(
      key: state.pageKey,
      child: AllOwnProject(
        projects: state.extra as List<ServiceDto>,
      ),
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
              itemCount: projects.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                    onTap: () {
                      context.pushNamed(ProjectOwn.routeName);
                    },
                    child: PostedProjectCard(
                      project: projects[index],
                    ));
              }),
        ),
      ),
    );
  }
}
