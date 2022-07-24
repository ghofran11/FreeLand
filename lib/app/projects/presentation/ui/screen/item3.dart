import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../common/config/theme/src/colors.dart';
import '../../../../../common/widgets/text.dart';
class Item3 extends StatelessWidget {
  const Item3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(decoration: const BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.3, 1],
          colors: [Color(0xff007FFF),Color(0xff4CFFD6),]
      ),
    ),
      child:Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              const CustomText.titleMedium('Level 3'),
              SizedBox(height: 20.0.h,),
              const CustomText.titleMedium('Notes'),
              const CustomText.bodySmall('this level you should start with the forth screen about lab and water ,Lab should have a lot flowers any one choose this'),
              SizedBox(height: 20.0.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:  [
                  Column(
                    children: [
                    const  CustomText.titleMedium(' \$ 350',style: TextStyle(color: AppColors.primary),),
                      SizedBox(height: 8.0.h,),
                    const  CustomText.titleMedium('Salary'),
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
                     const CustomText.titleMedium('15/5',style: TextStyle(color: AppColors.primary)),
                      SizedBox(height: 8.0.h,),
                      const CustomText.titleMedium('Deadline',),
                    ],
                  ),
                const  SizedBox(
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
                     const CustomText.titleMedium('\$1000',style: TextStyle(color: AppColors.primary)),
                      SizedBox(height: 8.0.h,),
                    const  CustomText.titleMedium('Rest Salary'),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 25.0.h,),
            ElevatedButton(
                onPressed: (){},
                child: Text('If this level completed verify this ')),
            ],
          ),
        ),
      ),
    );
  }
}
