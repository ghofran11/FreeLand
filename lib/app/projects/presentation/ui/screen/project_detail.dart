import 'package:cached_network_image/cached_network_image.dart';
import 'package:colours/colours.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freeland/app/home/infrastructure/models/service.dart';
import 'package:freeland/app/projects/presentation/ui/screen/comment_screen.dart';
import 'package:freeland/app/projects/presentation/ui/screen/offer_screen.dart';
import 'package:freeland/common/utils/image.dart';
import 'package:freeland/common/widgets/currency_symbo.dart';
import 'package:go_router/go_router.dart';

import '../../../../../common/config/theme/src/colors.dart';
import '../../../../../common/config/theme/src/styles.dart';
import '../../../../../common/widgets/text.dart';

class ProjectDetail extends StatefulWidget {
  final ServiceDto service;

  ProjectDetail({Key? key, required this.service}) : super(key: key);

  static Page pageBuilder(BuildContext context, GoRouterState state) {
    return MaterialPage<void>(
      key: state.pageKey,
      child: ProjectDetail(service: state.extra as ServiceDto),
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
        body: Stack(
      children: [
        ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Container(
                height: MediaQuery.of(context).size.height / 4,
                width: MediaQuery.of(context).size.width,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: CachedNetworkImageProvider(buildDocPath(
                            widget.service.documentDto?[0]?.path))),
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(buttonBorderRadius),
                        bottomRight: Radius.circular(buttonBorderRadius)))),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText.titleMedium(widget.service.name),
                          CustomText.bodySmall(
                            widget.service.nameOwner,
                            style: const TextStyle(color: Colours.grey),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        children: [
                          Row(
                            children: [
                              CustomText.labelMedium(
                                widget.service.minPrice.toString(),
                                style:
                                    const TextStyle(color: AppColors.primary),
                              ),
                              const CurrencySymbol(
                                color: AppColors.primary,
                              ),
                              const CustomText.labelMedium('-'),
                              CustomText.labelMedium(
                                  widget.service.maxPrice.toString(),
                                  style: const TextStyle(
                                      color: AppColors.primary)),
                              const CurrencySymbol(
                                color: AppColors.primary,
                              ),
                            ],
                          ),
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
                      SizedBox(
                        height: 5.0.h,
                      ),
                      CustomText.bodyMedium(widget.service.description),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(color: AppColors.black),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 50.0,
                      width: 50.0,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      child: const CircleAvatar(
                          radius: 50,
                          backgroundImage: CachedNetworkImageProvider(
                            "https://www.acecloudhosting.com/blog/wp-content/uploads/2020/05/remote-working-for-small-business-600x343.jpg",
                          )),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: InkWell(
                      onTap: () {
                        context.pushNamed(CommentScreen.routeName,
                            extra: widget.service.id);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          CustomText.titleSmall(
                            "Leave a comment",
                            style: TextStyle(color: AppColors.grey2),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Colours.lightBlue,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: 30,
          left: 10,
          child: IconButton(
              onPressed: () {
                context.pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: AppColors.primary,
              )),
        ),
        Positioned(
          bottom: 20,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              // style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green),),
              onPressed: () {
                context.pushNamed(OfferScreen.routeName,
                    extra: [widget.service.id, widget.service.name]);
              },
              child: const CustomText.bodyMedium(
                'Add your offer',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        )
      ],
    ));
  }
}
