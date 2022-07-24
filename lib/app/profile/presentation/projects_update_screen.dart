import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freeland/app/profile/presentation/update_add_project.dart';
import 'package:freeland/common/config/theme/src/styles.dart';
import 'package:freeland/common/widgets/text.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../common/config/theme/src/colors.dart';

class ProjectsUpdateScreen extends StatefulWidget {
  const ProjectsUpdateScreen({Key? key}) : super(key: key);

  static Page pageBuilder(BuildContext context, GoRouterState state) {
    return MaterialPage<void>(
      key: state.pageKey,
      child: ProjectsUpdateScreen(),
    );
  }

  static const routePath = 'projects_update';
  static const routeName = 'projects_update';

  @override
  State<ProjectsUpdateScreen> createState() => _ProjectsUpdateScreenState();
}

class _ProjectsUpdateScreenState extends State<ProjectsUpdateScreen> {
  FormGroup formGroup = FormGroup({
    "name": FormControl<String>(),
    "bio": FormControl<String>(),
    "categories_search": FormControl<String>(),
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: EdgeInsets.all(horizontalAppPadding.r),
        child: ElevatedButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText.bodyMedium("Save",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary)),
            ],
          ),
          onPressed: () {},
        ),
      ),
      appBar: AppBar(
        title: CustomText.titleLarge("Edit Projects"),
      ),
      body: SafeArea(
        child: ReactiveForm(
          formGroup: formGroup,
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: 2,
            separatorBuilder: (context, index) => SizedBox(height: 10.0.h),
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => const ProjectInfo(),
          ),
        ),
      ),
    );
  }
}

class ProjectInfo extends StatelessWidget {
  const ProjectInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const CustomText.titleMedium("Smart-Start"),
            const Spacer(),
            const CustomText.bodyMedium("5.0"),
            SizedBox(
              width: 2.0.w,
            ),
            FaIcon(
              FontAwesomeIcons.solidStar,
              color: AppColors.primary.withOpacity(0.3),
              size: 12.0.r,
            ),
            IconButton(
                onPressed: () {
                  context.pushNamed(AddUpdateProject.routeName);
                },
                icon: const FaIcon(FontAwesomeIcons.pen))
          ],
        ),
        SizedBox(height: 2.0.h),
        CustomText.bodyMedium("Ahmed Mohammed",
            style: TextStyle(color: Theme.of(context).disabledColor)),
        SizedBox(height: 4.0.h),
        const CustomText.bodyMedium(
          'interfaces for iOS and Android apps with the unified codebase.open source framework',
          maxLines: null,
        ),
      ],
    );
  }
}
