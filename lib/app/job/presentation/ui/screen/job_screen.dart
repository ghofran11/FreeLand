import 'package:cached_network_image/cached_network_image.dart';
import 'package:comment_box/comment/comment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freeland/app/job/presentation/ui/screen/comment_screen.dart';
import 'package:freeland/app/job/presentation/ui/screen/offer_screen.dart';
import 'package:freeland/common/widgets/text_field.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../common/config/theme/src/colors.dart';
import '../../../../../common/config/theme/src/styles.dart';
import '../../../../../common/widgets/text.dart';
import '../../../../home/presentation/ui/screen/home_screen.dart';
class JobScreen extends StatefulWidget {
   JobScreen({Key? key}) : super(key: key);
  static Page pageBuilder(BuildContext context, GoRouterState state) {
    return MaterialPage<void>(
      key: state.pageKey,
      child:  JobScreen(),
    );
  }
  static const routePath = 'job_screen';
  static const routeName = 'job_screen';

  @override
  State<JobScreen> createState() => _JobScreenState();
}

class _JobScreenState extends State<JobScreen> {
  final formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(
            vertical: verticalAppPadding.h, horizontal: horizontalAppPadding.w),
        children:  [
        const  SizedBox(height: 12,),
         Row(
           children: [
             IconButton(onPressed: (){
               context.pop();
             },
                 icon:const Icon(Icons.arrow_back_ios,color: AppColors.primary,) ),
            const CustomText.titleLarge('Job Details',style: TextStyle(fontWeight: FontWeight.bold,color:  AppColors.primary),),
           ],
         ),
          const Padding(
            padding: EdgeInsets.only(top: 16),
            child: Card(
              color: AppColors.white,
              child:ListTile(
                title:CustomText.titleLarge('UI/UX Designer'),
                subtitle:CustomText.titleMedium('Ahmad Ahmad'),
              ),
            ),
          ),   SizedBox(height: 7.0.h,),

          Row(
            children: [
              const CustomText.titleMedium("STATUS"),
              const Spacer(),
              const CustomText.bodyMedium("Executed",style: TextStyle(color: AppColors.greenAccent)),
              SizedBox(
                width: 2.0.w,
              ),
            ],
          ),
          const  SizedBox(height: 10,),
          Row(
            children: [
              const CustomText.titleMedium("Salary"),
              const Spacer(),
              const CustomText.bodyMedium("5.000-7.000",style: TextStyle(color: AppColors.primary),),
              SizedBox(
                width: 2.0.w,
              ),
            ],
          ),
          const SizedBox(height: 10,),


          const Divider(color: AppColors.black),
          const  SizedBox(height: 10,),
          Card(

            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(

                children:  [
                  Container(
                      height: 180.0.h,
                      width: 280.0.w,
                      clipBehavior: Clip.hardEdge,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: CachedNetworkImageProvider("https://cdn.dribbble.com/users/311228/screenshots/8571759/media/6e49609e0146d972ab5665d6bace48d4.jpg")),
                          borderRadius:
                          BorderRadius.all(Radius.circular(buttonBorderRadius)))
                  ),
                  SizedBox(height: 10.0.h,),
                 const CustomText.bodyMedium('UI/UX het succes van jouw email campagnes. Begin met het sturen van de juiste boodschap. Vraag een online demo aan en ontdek wat Mopinion voor jou kan betekenen. Online Demo. Maak eigen feedbackforms. Real Time inzichten. Feedback voor Apps. Verhoog conversie. Slimmere dashboards. Feedback voor Websites. Feedback voor Email. Typen: Mopinion voor Websites, Mopinion voor Apps.Verhoog het succes van jouw email campagnes. Begin met het sturen van de juiste boodschapVerhoog het succes van jouw email campagnes. Begin met het sturen van de juiste boodschapVerhoog het succes van jouw email campagnes. Begin met het sturen van de juiste boodschap'),
                  SizedBox(height: 5.0.h,),

               const   Divider(color: AppColors.black),
                  Row(
                    children: [
                      Column(children: const [
                        Icon(Icons.comment,color: AppColors.grey,size: 2,)  ,
                        CustomText.titleSmall("Leave a comment"),
                      ],),

                      const Spacer(),
                      IconButton(
                        icon:const Icon(Icons.arrow_forward_ios_outlined,color: AppColors.primary,),
                        onPressed: (){
                          context.pushNamed(commentScreen.routeName);
                        },
                      ),

                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10.0.h,),
          ElevatedButton(
            onPressed: (){
              context.pushNamed(OfferScreen.routeName);
            },
            child:const CustomText.bodyMedium('ADD YOUR OFFER',style: TextStyle(color: Colors.white),),
          ),
        ],
      ),
    );
  }
}
