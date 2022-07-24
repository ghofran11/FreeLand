import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freeland/app/profile/presentation/projects_update_screen.dart';
import 'package:freeland/app/profile/presentation/widgets/portfolio_info.dart';
import 'package:freeland/common/widgets/text.dart';
import 'package:go_router/go_router.dart';

class ProfileProjectsSection extends StatelessWidget {
  final bool showEdit;
  const ProfileProjectsSection({Key? key, this.showEdit = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    int _itemCount = 3;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const CustomText.headlineSmall("Projects"),
            IconButton(
                onPressed: () {
                  context.pushNamed(ProjectsUpdateScreen.routeName);
                },
                icon: const FaIcon(FontAwesomeIcons.pen))
          ],
        ),
        SizedBox(height: 8.0.h),
        ListView.separated(
          shrinkWrap: true,
          itemCount: 2,
          separatorBuilder: (context, index) => SizedBox(height: 10.0.h),
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => const ProjectInfoWidget(),
        ),
        if (_itemCount > 2)
          Center(
            child: TextButton(
              onPressed: () {},
              child: CustomText.bodyMedium("See All",
                  style: TextStyle(color: Theme.of(context).primaryColor)),
            ),
          ),
      ],
    );
  }
}
