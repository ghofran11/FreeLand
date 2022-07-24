import 'package:cached_network_image/cached_network_image.dart';
import 'package:colours/colours.dart';
import 'package:comment_box/comment/comment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freeland/app/projects/presentation/ui/screen/comment_screen.dart';
import 'package:freeland/app/projects/presentation/ui/screen/offer_screen.dart';
import 'package:freeland/common/widgets/text_field.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../common/config/theme/src/colors.dart';
import '../../../../../common/config/theme/src/styles.dart';
import '../../../../../common/widgets/text.dart';
import '../../../../home/presentation/ui/screen/home_screen.dart';

class ProjectDetail extends StatefulWidget {
  ProjectDetail({Key? key}) : super(key: key);

  static Page pageBuilder(BuildContext context, GoRouterState state) {
    return MaterialPage<void>(
      key: state.pageKey,
      child: ProjectDetail(),
    );
  }

  static const routePath = 'project_detail';
  static const routeName = 'project_detail';

  @override
  State<ProjectDetail> createState() => _ProjectDetailState();
}

class _ProjectDetailState extends State<ProjectDetail> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(
            vertical: verticalAppPadding.h, horizontal: horizontalAppPadding.w),
        children: [
          const SizedBox(
            height: 12,
          ),
          Stack(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(buttonBorderRadius),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        height: 190.0.h,
                        width: 340.0.w,
                        clipBehavior: Clip.hardEdge,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: CachedNetworkImageProvider(
                                    "https://www.mindinventory.com/blog/wp-content/uploads/2021/08/app-ui-ux-design.png")),
                            borderRadius: BorderRadius.all(
                                Radius.circular(buttonBorderRadius)))),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  CustomText.titleLarge('UI/UX Design'),
                                  CustomText.bodySmall(
                                    'by Ahmad Ahmad',
                                    style: TextStyle(color: Colours.grey),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Column(
                                children: const [
                                  CustomText.titleMedium('\$200-300',
                                      style:
                                          TextStyle(color: Colours.lightBlue)),
                                  CustomText.labelMedium('Available'),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15.0.h,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const CustomText.titleMedium(
                                'Details',
                                style: TextStyle(
                                  color: Colours.lightBlue,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                              SizedBox(
                                height: 5.0.h,
                              ),
                              const CustomText.bodyMedium(
                                  'UI/UX het succes van jouw email campagnes. Begin met het sturen van de juiste boodschap. Vraag een online demo aan en ontdek wat Mopinion voor jou kan betekenen. Online Demo. Maak eigen feedbackforms. Real Time inzichten. Feedback voor Apps. Verhoog conversie. Slimmere dashboards. Feedback voor Websites. Feedback voor Email. Typen: Mopinion voor Websites, Mopinion voor Apps.Verhoog het succes van jouw email campagnes. Begin met het sturen van de juiste boodschapVerhoog het succes van jouw email campagnes. Begin met het sturen van de juiste boodschapVerhoog het succes van jouw email campagnes. Begin met het sturen van de juiste boodschap'),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const Divider(color: AppColors.black),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        children: [
                         const CustomText.titleSmall("Leave a comment"),
                          const Spacer(),
                          IconButton(
                            icon: const Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: Colours.lightBlue,
                            ),
                            onPressed: () {
                              context.pushNamed(CommentScreen.routeName);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.primary,
                  )),
            ],
          ),
          SizedBox(
            height: 10.0.h,
          ),
          ElevatedButton(
            onPressed: () {
              context.pushNamed(OfferScreen.routeName);
            },
            child: const CustomText.bodyMedium(
              'ADD YOUR OFFER',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
