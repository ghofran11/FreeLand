import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freeland/app/home/infrastructure/models/service.dart';
import 'package:freeland/app/profile/presentation/screens/all_projects_screen.dart';
import 'package:freeland/app/profile/presentation/widgets/portfolio_info.dart';
import 'package:freeland/common/widgets/text.dart';
import 'package:go_router/go_router.dart';

class ProfileProjectsSection extends StatelessWidget {
  final List<ServiceDto> services;
  final bool isMe;

  const ProfileProjectsSection({
    Key? key,
    required this.services,
    required this.isMe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int _itemCount = min(services.length, 3);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomText.headlineSmall("Projects"),
        SizedBox(height: 8.0.h),
        if (_itemCount > 0)
          ListView.separated(
            shrinkWrap: true,
            itemCount: _itemCount,
            separatorBuilder: (context, index) => SizedBox(height: 10.0.h),
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => ProjectInfoWidget(
              serviceDto: services[index],
            ),
          ),
        if (_itemCount == 0)
          CustomText.bodyMedium('No Projects Yet',
              style: TextStyle(color: Theme.of(context).primaryColor)),
        if (_itemCount > 2)
          Center(
            child: TextButton(
              onPressed: () {
                context.pushNamed(AllProjectsScreen.routeName,
                    extra: AllProjectsScreenParam(
                      services: services,
                      editable: isMe,
                    ));
              },
              child: CustomText.bodyMedium("See All",
                  style: TextStyle(color: Theme.of(context).primaryColor)),
            ),
          ),
      ],
    );
  }
}
