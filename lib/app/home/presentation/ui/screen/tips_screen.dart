import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freeland/app/home/presentation/ui/screen/home_screen.dart';
import 'package:freeland/app/home/presentation/ui/widget/tip.dart';
import 'package:go_router/go_router.dart';

import '../../../../../common/config/theme/src/colors.dart';
import '../../../../../common/config/theme/src/styles.dart';
import '../../../../../common/widgets/text.dart';

class TipsScreen extends StatelessWidget {
  final int index;

  const TipsScreen({Key? key, required this.index}) : super(key: key);

  static Page pageBuilder(BuildContext context, GoRouterState state) {
    return MaterialPage<void>(
      key: state.pageKey,
      child: TipsScreen(
        index: state.extra! as int,
      ),
    );
  }

  static const routePath = 'tip_screen';
  static const routeName = 'tip_screen';

  @override
  Widget build(BuildContext context) {
    final Tip tips = Tip();
    return Scaffold(
      body: ListView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(
              vertical: verticalAppPadding.h,
              horizontal: horizontalAppPadding.w),
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                IconButton(
                 // padding: EdgeInsets.symmetric(horizontal: 5,vertical:5 ),
                    onPressed: () {
                      context.pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.primary,
                    ),
                ),
                SizedBox(width: 3.0.w,),
                const CustomText.titleLarge(
                  'Tips for You',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,),
                ),
              ],
            ),
            SizedBox(height: 25.0.h,),
            Container(
              height: 180.0.h,
              width: 100.0.w,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(tips.imgList[index])),
                  borderRadius: const BorderRadius.all(
                      Radius.circular(buttonBorderRadius))),
            ),
            SizedBox(height: 25.0.h,),
            CustomText.titleMedium(
              tips.titelList[index],
              style:const TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10.0.h,
            ),
            CustomText.bodyMedium(tips.descList[index]),
          ]),
    );
  }
}
