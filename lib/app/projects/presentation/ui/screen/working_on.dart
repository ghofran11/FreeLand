import 'package:carousel_slider/carousel_slider.dart';
import 'package:colours/colours.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freeland/common/config/theme/src/colors.dart';
import 'package:freeland/common/widgets/text.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:timeline_tile/timeline_tile.dart';



class WorkingOn extends StatefulWidget {
  const WorkingOn({Key? key}) : super(key: key);

  static Page pageBuilder(BuildContext context, GoRouterState state) {
    return MaterialPage<void>(
      key: state.pageKey,
      child: WorkingOn(),
    );
  }

  static const routePath = 'workingOn_screen';
  static const routeName = 'workingOn_screen';

  @override
  State<WorkingOn> createState() => _WorkingOnState();
}

class _WorkingOnState extends State<WorkingOn> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Row(
              children: [
                const SizedBox(
                  height: 12,
                ),
                IconButton(
                    onPressed: () {
                      context.pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.primary,
                    )),
                const CustomText.titleLarge(
                  'Flower Lab ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: AppColors.primary),
                ),
              ],
            ),
            SizedBox(height: 20.0.h,),
            TimelineTile(
              alignment: TimelineAlign.manual,
              endChild: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  CustomText.titleLarge('Analyze Data'),
                  CustomText.bodySmall('completed',style: TextStyle(color: Colours.green),),
                ],
              ),
              lineXY: 0.2,
              isFirst: true,
              indicatorStyle:  IndicatorStyle(
                indicatorXY: 0.2,
                padding: EdgeInsets.all(8),
                width: 32,
                height: 32,
                color: AppColors.primary,

                iconStyle: IconStyle(
                color: Colors.white,
                iconData: Icons.insert_emoticon,
              ),
              ),
              beforeLineStyle: const LineStyle(
                color: Colours.grey,
                thickness: 3,
              ),
            ),

            TimelineTile(
              alignment: TimelineAlign.manual,
              endChild: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  CustomText.titleLarge('Design UI/UX'),
                  CustomText.bodySmall('completed',style: TextStyle(color: AppColors.green),),
                ],
              ),
              lineXY: 0.2,

              indicatorStyle:  IndicatorStyle(
                indicatorXY: 0.2,
                padding: EdgeInsets.all(8),
                width: 32,
                height: 32,
                color: AppColors.primary,
                drawGap: true,
                indicator: Container(
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    border: Border.fromBorderSide(
                      BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Text(
                      '2',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),
              beforeLineStyle: const LineStyle(
                color: Colours.grey,
                thickness: 3,
              ),
            ),
            TimelineTile(
              alignment: TimelineAlign.manual,
              endChild: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  CustomText.titleLarge('Analise'),
                  CustomText.bodySmall('deadline 20/1',style: TextStyle(color: AppColors.grey2),),
                ],
              ),
              lineXY: 0.2,
              indicatorStyle:  IndicatorStyle(
                indicatorXY: 0.2,
                padding: EdgeInsets.all(8),
                width: 32,
                height: 32,
                color: AppColors.primary,
                drawGap: true,
                indicator: Container(
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    border: Border.fromBorderSide(
                      BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Text(
                      '3',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),
              beforeLineStyle: const LineStyle(
                color: Colours.grey,
                thickness: 3,
              ),
            ),
            TimelineTile(
              alignment: TimelineAlign.manual,
              endChild: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  CustomText.titleLarge('Analise'),
                  CustomText.bodySmall('deadline 20/1',style: TextStyle(color: AppColors.grey2),),
                ],
              ),
              lineXY: 0.2,
             isLast: true,
              indicatorStyle:  IndicatorStyle(
                indicatorXY: 0.2,
                padding: EdgeInsets.all(8),
                width: 32,
                height: 32,
                color: AppColors.primary,
                drawGap: true,
                indicator: Container(
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    border: Border.fromBorderSide(
                      BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Text(
                      '4',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),
              beforeLineStyle: const LineStyle(
                color: Colours.grey,
                thickness: 3,
              ),
            ),



          ],
        ),
      ),
    );
  }
}
