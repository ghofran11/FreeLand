import 'package:colours/colours.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freeland/common/config/theme/src/colors.dart';
import 'package:freeland/common/widgets/text.dart';
import 'package:go_router/go_router.dart';
import 'package:timeline_tile/timeline_tile.dart';

final int length = 4;

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
  int _selectedIndex = 0;

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
                  'Flower Lab Details',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: AppColors.primary),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: CustomText.bodyMedium(
                  "These are the levels of Flowes LAb prject, when you finish a level please submit it as completed to move on to next level>"),
            ),
            SizedBox(
              height: 20.0.h,
            ),
            ...levels()
          ],
        ),
      ),
    );
  }

  List<Widget> levels() {
    return List.generate(
        4,
        (i) => i == _selectedIndex
            ? currentLevel(i)
            : OtherLevel(
                index: i,
              ));
  }

  currentLevel(int index) => TimelineTile(
        alignment: TimelineAlign.manual,
        endChild: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText.titleLarge('Analise'),
            CustomText.bodyMedium(
              'Description for level is: Facebook is a social networking site that makes it easy for you to connect and share with family and friends online. Originally designed for college students, Facebook was created in 2004 by Mark Zuckerberg while he was enrolled at Harvard University. By 2006, anyone over the age of 13 with a valid email address could join Facebook. Today, Facebook is the worlds largest social network, with more than 1 billion users worldwide.',
            ),
            SizedBox(height: 4.0),
            CustomText.bodySmall(
              'Budget: 100 S.P',
              style: TextStyle(color: AppColors.grey2),
            ),
            SizedBox(height: 4.0),
            CustomText.bodySmall(
              'Deadline 20/1/2022',
              style: TextStyle(color: AppColors.grey2),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _selectedIndex = index + 1;
                    });
                  },
                  child: Text("Submit this level as Completed")),
            )
          ],
        ),
        lineXY: 0.1,
        isLast: length == index + 1,
        indicatorStyle: IndicatorStyle(
          indicatorXY: 0.0,
          padding: EdgeInsets.all(8),
          width: 32,
          height: 35,
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
            child: Center(
              child: Text(
                (index + 1).toString(),
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
        beforeLineStyle: const LineStyle(
          color: Colours.grey,
          thickness: 3,
        ),
      );
}

// class CurrentLevel extends StatelessWidget {
//   final int index;
//
//   const CurrentLevel({
//     Key? key,
//     required this.index,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return TimelineTile(
//       alignment: TimelineAlign.manual,
//       endChild: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: const [
//           CustomText.titleLarge('Analise'),
//           CustomText.bodyMedium(
//             'Description for level is: Facebook is a social networking site that makes it easy for you to connect and share with family and friends online. Originally designed for college students, Facebook was created in 2004 by Mark Zuckerberg while he was enrolled at Harvard University. By 2006, anyone over the age of 13 with a valid email address could join Facebook. Today, Facebook is the worlds largest social network, with more than 1 billion users worldwide.',
//           ),
//           SizedBox(height: 4.0),
//           CustomText.bodySmall(
//             'Budget: 100 S.P',
//             style: TextStyle(color: AppColors.grey2),
//           ),
//           SizedBox(height: 4.0),
//           CustomText.bodySmall(
//             'deadline 20/1',
//             style: TextStyle(color: AppColors.grey2),
//           ),
//         ],
//       ),
//       lineXY: 0.15,
//       isLast: length == index + 1,
//       indicatorStyle: IndicatorStyle(
//         indicatorXY: 0.15,
//         padding: EdgeInsets.all(8),
//         width: 32,
//         height: 32,
//         color: AppColors.primary,
//         drawGap: true,
//         indicator: Container(
//           decoration: const BoxDecoration(
//             color: AppColors.primary,
//             border: Border.fromBorderSide(
//               BorderSide(
//                 color: Colors.white,
//               ),
//             ),
//             shape: BoxShape.circle,
//           ),
//           child: Center(
//             child: Text(
//               (index + 1).toString(),
//               style: TextStyle(
//                 color: AppColors.white,
//                 fontSize: 20,
//               ),
//             ),
//           ),
//         ),
//       ),
//       beforeLineStyle: const LineStyle(
//         color: Colours.grey,
//         thickness: 3,
//       ),
//     );
//   }
// }

class OtherLevel extends StatelessWidget {
  final int index;

  const OtherLevel({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      alignment: TimelineAlign.manual,
      endChild: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 12.0,
          ),
          (index % 2 == 0)
              ? CustomText.titleLarge('Support')
              : CustomText.titleLarge('Design'),
        ],
      ),
      lineXY: 0.1,
      isLast: length == index + 1,
      indicatorStyle: IndicatorStyle(
        indicatorXY: 0.0,
        padding: EdgeInsets.all(8),
        width: 32,
        height: 35,
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
          child: Center(
            child: Text(
              (index + 1).toString(),
              style: TextStyle(
                color: AppColors.white,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
      beforeLineStyle: const LineStyle(
        color: Colours.grey,
        thickness: 3,
      ),
    );
  }
}
