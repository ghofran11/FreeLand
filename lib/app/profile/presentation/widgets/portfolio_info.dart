import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freeland/app/home/infrastructure/models/service.dart';
import 'package:freeland/app/profile/presentation/widgets/read_more.dart';
import 'package:freeland/common/config/theme/src/colors.dart';
import 'package:freeland/common/widgets/text.dart';

class ProjectInfoWidget extends StatelessWidget {
  final ServiceDto serviceDto;
  const ProjectInfoWidget({Key? key, required this.serviceDto})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CustomText.titleMedium(serviceDto.name),
            const Spacer(),
            CustomText.bodyMedium(serviceDto.evalution.toString()),
            SizedBox(
              width: 2.0.w,
            ),
            FaIcon(
              FontAwesomeIcons.solidStar,
              color: AppColors.primary.withOpacity(0.3),
              size: 12.0.r,
            ),
          ],
        ),
        SizedBox(height: 2.0.h),
        CustomText.bodyMedium(serviceDto.nameOwner,
            style: TextStyle(color: Theme.of(context).disabledColor)),
        SizedBox(height: 4.0.h),
        AppReadMore(text: serviceDto.description)
      ],
    );
  }
}
