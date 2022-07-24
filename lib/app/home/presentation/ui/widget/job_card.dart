import 'package:colours/colours.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../common/config/theme/src/colors.dart';
import '../../../../../common/widgets/text.dart';
import '../../../../job/presentation/ui/screen/job_screen.dart';
class JobCard extends StatelessWidget {
  const JobCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: () {
        context.pushNamed(JobScreen.routeName);
      },
      child: Card(
        color: Colours.white,
        // color: Colors.white.withOpacity(0.8)
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              CustomText.titleMedium('Ahmad Ahmad'),
              SizedBox(
                height: 3,
              ),
              CustomText.labelMedium(' \$400-700'),
              SizedBox(
                height: 3,
              ),
              CustomText.bodySmall(
                  'Ahmad Ahmad \$400-700  we have project Ahmad Ahmad we have project Ahmad Ahmad \$400-700  we have projectAhmad Ahmad \$400-700  we have projectAhmad Ahmad \$400-700  we have projectAhmad Ahmad \$400-700  we have projectAhmad Ahmad \$400-700  we have projectAhmad Ahmad \$400-700  we have projectAhmad Ahmad \$400-700  we have projectAhmad Ahmad \$400-700  we have projectAhmad Ahmad \$400-700  we have projectAhmad Ahmad \$400-700  we have projectAhmad Ahmad \$400-700  we have projectAhmad Ahmad \$400-700  we have projectAhmad Ahmad \$400-700  we have projectAhmad Ahmad \$400-700  we have projectAhmad Ahmad \$400-700  we have projectAhmad Ahmad \$400-700  we have projectAhmad Ahmad \$400-700  we have projectAhmad Ahmad \$400-700  we have projectAhmad Ahmad \$400-700  we have projectAhmad Ahmad \$400-700  we have projectAhmad Ahmad \$400-700  we have projectAhmad Ahmad \$400-700  we have projectAhmad Ahmad \$400-700  we have project',
                  style: TextStyle(color: AppColors.grey2,),
                  maxLines: 1,
                  textOverflow: TextOverflow.ellipsis),
            ],
          ),
        ),
      ),
    );
  }
}
