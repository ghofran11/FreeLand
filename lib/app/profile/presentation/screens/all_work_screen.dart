import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freeland/app/profile/presentation/widgets/project_info.dart';
import 'package:freeland/common/config/theme/src/styles.dart';
import 'package:freeland/common/widgets/text.dart';
import 'package:go_router/go_router.dart';

class AllWorkScreen extends StatelessWidget {
  const AllWorkScreen({Key? key, this.showEdit = false}) : super(key: key);
  final bool showEdit;

  static Page pageBuilder(BuildContext context, GoRouterState state) {
    return MaterialPage<void>(
      key: state.pageKey,
      child: const AllWorkScreen(),
    );
  }

  static const routePath = 'all_work_screen';
  static const routeName = 'all_work_screen';

  @override
  Widget build(BuildContext context) {
    int _itemCount = 3;
    return Scaffold(
      appBar: AppBar(
        title: const CustomText.headlineSmall("All Work"),
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
                  itemCount: 10,
                  separatorBuilder: (context, index) => const Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.0),
                      child: Divider(
                        thickness: 1.5,
                      )),
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => const PortfolioInfoWidget(
                      //ToDo:
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
