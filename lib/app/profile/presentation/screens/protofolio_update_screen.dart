import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freeland/app/profile/infrastructur/models/my_profile.dart';
import 'package:freeland/app/profile/presentation/widgets/project_info.dart';
import 'package:freeland/app/profile/presentation/widgets/update_add_work.dart';
import 'package:freeland/common/config/theme/src/styles.dart';
import 'package:freeland/common/widgets/text.dart';
import 'package:go_router/go_router.dart';

class PortfolioUpdateScreen extends StatelessWidget {
  const PortfolioUpdateScreen({Key? key, required this.works})
      : super(key: key);
  final List<WorkDtos> works;

  static Page pageBuilder(BuildContext context, GoRouterState state) {
    return MaterialPage<void>(
      key: state.pageKey,
      child: PortfolioUpdateScreen(works: state.extra as List<WorkDtos>),
    );
  }

  static const routePath = 'projects_update';
  static const routeName = 'projects_update';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText.titleLarge("Edit Portfolio"),
        actions: [
          IconButton(
              onPressed: () {
                context.pushNamed(AddUpdateWork.routeName);
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: SafeArea(
        child: ListView.separated(
          padding: EdgeInsets.symmetric(
              vertical: verticalAppPadding.h,
              horizontal: horizontalAppPadding.w),
          shrinkWrap: true,
          itemCount: works.length,
          separatorBuilder: (context, index) => const Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0),
              child: Divider(
                thickness: 1.5,
              )),
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) =>
              PortfolioInfoWidget(showEdit: true, workDtos: works[index]),
        ),
      ),
    );
  }
}
