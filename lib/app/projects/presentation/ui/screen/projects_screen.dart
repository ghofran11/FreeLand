
import 'package:colours/colours.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freeland/app/projects/presentation/ui/screen/project_on.dart';
import 'package:go_router/go_router.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../../common/config/theme/src/colors.dart';
import '../../../../../common/config/theme/src/styles.dart';
import '../../../../../common/widgets/text.dart';
class ProjectPage extends StatelessWidget {
  const ProjectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
     body: ListView(
       padding: EdgeInsets.symmetric(horizontal: horizontalAppPadding.w),
       physics: const BouncingScrollPhysics(),

       children: [
         SizedBox(height: 10.0.h,),
         const CustomText.titleLarge(
           'Projects',
           style: TextStyle(
               fontWeight: FontWeight.bold, color: AppColors.primary),
         ),
         SizedBox(height: 10.0.h,),
        Row(
          children: const [
             CustomText.titleMedium('Own project',style: TextStyle(fontWeight: FontWeight.bold),),
            Spacer(),
             CustomText.bodySmall("See All",style: TextStyle(color: AppColors.primary))
          ],
        ),
         SizedBox(height: 10.0.h),
         Card(
           child: Padding(
             padding: const EdgeInsets.all(10.0),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children:  [
                const CustomText.titleMedium('Medical Website'),
                 SizedBox(height: 5.0.h,),
                const CustomText.titleMedium('200-500 \$'),
                 SizedBox(height: 5.0.h,),
                 const CustomText.titleMedium('15 offer'),
                 SizedBox(height: 5.0.h,),
                 const CustomText.titleMedium('average offer :200\$'),
               ],
             ),
           ),
         ),
         SizedBox(height: 10.0.h,),

         Row(
           children: const [
             CustomText.titleMedium('Working On',style: TextStyle(fontWeight: FontWeight.bold),),
             Spacer(),
             CustomText.bodySmall("See All",style: TextStyle(color: AppColors.primary),)
           ],
         ),
         SizedBox(height: 10.0.h),

         InkWell(
           onTap: (){
             context.pushNamed(ProjectOn.routeName);
           },
           child: Card(
             child: Padding(
               padding: const EdgeInsets.all(8.0),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children:  [
                   Row(
                     children: [
                       Column(
                         children: [
                           const CustomText.titleMedium('UI flowers Lab'),
                           SizedBox(height: 5.0.h,),
                           const CustomText.titleMedium('Level 2 '),
                           SizedBox(height: 5.0.h,),
                           const CustomText.titleMedium('Deadline 15/5'),
                         ],
                       ),
                       Spacer(),
                       CircularPercentIndicator(
                         radius: 35.0,
                         lineWidth: 5.0,
                         percent: 0.5,
                         center: new Text("Work 50"),
                         progressColor: Colours.lightBlue,
                       ),
                     ],
                   ),




                 ],
               ),
             ),
           ),
         ),
       ],
     ),
    );
  }
}
