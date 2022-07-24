import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../common/config/theme/src/colors.dart';
import '../../../../../common/widgets/text.dart';
class Item2 extends StatelessWidget {
  const Item2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.3, 1],
            colors: [Color(0xff007FFF), Color(0xff4CFFD6)]
        ),
      ),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              Row(
                children: [
                  const CustomText.titleMedium('Level 2'),
                  const Spacer(),
                  FaIcon(FontAwesomeIcons.circleCheck, size: 20.0.r,color: AppColors.red,),
                ],
              ),
              SizedBox(height: 20.0.h,),
              const CustomText.titleMedium('Notes'),
              const CustomText.bodySmall('this level you should start with the forth screen about lab and water ,Lab should have a lot flowers any one choose this '),
              SizedBox(height: 20.0.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:  [
                  Column(
                    children: [
                      CustomText.titleMedium(' \$ 350',style: TextStyle(color: AppColors.primary),),
                      SizedBox(height: 8.0.h,),
                      CustomText.titleMedium('Salary'),

                    ],
                  ),
                  const SizedBox(
                    height: 50,
                    child: VerticalDivider(
                      //width: 20,
                      thickness: 1.5,
                      indent: 10,
                      color: Colors.grey,
                    ),
                  ),
                  Column(
                    children: [
                      CustomText.titleMedium('15/5',style: TextStyle(color: AppColors.primary)),
                      SizedBox(height: 8.0.h,),
                      CustomText.titleMedium('Deadline',),

                    ],
                  ),
                  SizedBox(
                    height: 50,
                    child: VerticalDivider(
                      //width: 20,
                      thickness: 1.5,
                      indent: 10,

                      color: Colors.grey,
                    ),
                  ),
                  Column(
                    children: [
                      CustomText.titleMedium('\$1000',style: TextStyle(color: AppColors.primary)),
                      SizedBox(height: 8.0.h,),
                      CustomText.titleMedium('Rest Salary'),

                    ],
                  ),
                ],
              ),

              SizedBox(height: 25.0.h,),
              ElevatedButton(
                  onPressed: (){},
                  child:const Text(' this level was completed at 10/1')),
            ],
          ),
        ),
      ),
    );
  }
}
