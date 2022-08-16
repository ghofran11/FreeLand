import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freeland/app/home/infrastructure/models/service.dart';
import 'package:freeland/app/profile/presentation/widgets/portfolio_info.dart';
import 'package:freeland/common/config/theme/src/styles.dart';
import 'package:freeland/common/widgets/text.dart';
import 'package:go_router/go_router.dart';

class AllProjectsScreenParam {
  final bool editable;
  final List<ServiceDto> services;

  AllProjectsScreenParam({this.editable = false, required this.services});
}

class AllProjectsScreen extends StatelessWidget {
  const AllProjectsScreen(
      {Key? key, required this.editable, required this.services})
      : super(key: key);
  final bool editable;
  final List<ServiceDto> services;

  static Page pageBuilder(BuildContext context, GoRouterState state) {
    final AllProjectsScreenParam params = state.extra as AllProjectsScreenParam;
    return MaterialPage<void>(
      key: state.pageKey,
      child: AllProjectsScreen(
          services: params.services, editable: params.editable),
    );
  }

  static const routePath = 'all_projects_screen';
  static const routeName = 'all_projects_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText.headlineSmall("All Projects"),
      ),
      body: SafeArea(
        child: Padding(
          padding: screenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.0.h),
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: services.length,
                  separatorBuilder: (context, index) => const Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.0),
                      child: Divider(
                        thickness: 1.5,
                      )),
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => ProjectInfoWidget(
                    serviceDto: services[index],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
