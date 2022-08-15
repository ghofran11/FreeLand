import 'package:colours/colours.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freeland/app/home/infrastructure/models/service.dart';
import 'package:freeland/common/widgets/currency_symbo.dart';
import 'package:go_router/go_router.dart';

import '../../../../../common/config/theme/src/colors.dart';
import '../../../../../common/widgets/text.dart';
import '../../../../projects/presentation/ui/screen/project_detail.dart';
class JobCard extends StatelessWidget {
  ServiceDto service;
   JobCard({Key? key,required this. service,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: () {
       context.pushNamed(ProjectDetail.routeName,extra: service);
      },
      child: Card(
        color: Colours.white,
        // color: Colors.white.withOpacity(0.8)
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              CustomText.titleMedium(service.nameOwner),
              SizedBox(
                height: 3.0.h,
              ),
              Row(
                children: [
                  CustomText.labelMedium(service.minPrice.toString() ,style:const TextStyle(color: AppColors.primary),),
                  const CurrencySymbol(color: AppColors.primary,),
                  const CustomText.labelMedium(' - ' ),
                  CustomText.labelMedium(service.maxPrice. toString(),style:const TextStyle(color: AppColors.primary),),
                  const CurrencySymbol(color: AppColors.primary,),

                ],
              ),
              SizedBox(
                height: 3.0.h,
              ),
              CustomText.bodySmall(
                service.description,
                  style:const TextStyle(color: AppColors.grey2,),
                  maxLines: 1,
                  textOverflow: TextOverflow.ellipsis),
            ],
          ),
        ),
      ),
    );
  }
}
