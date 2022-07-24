import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freeland/app/projects/presentation/ui/screen/item1.dart';
import 'package:freeland/common/config/theme/src/colors.dart';
import 'package:freeland/common/widgets/text.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import 'item2.dart';
import 'item3.dart';

class WorkingOn extends StatefulWidget {
  const WorkingOn({Key? key}) : super(key: key);

  @override
  State<WorkingOn> createState() => _WorkingOnState();
}

class _WorkingOnState extends State<WorkingOn> {
  double _value = 2.0;
  int _currentIndex=0;
  List cardList = [
    Item1(),
    Item2(),
    Item3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10.0.h,
            ),
            CustomText.titleMedium('the current level'),
            SizedBox(
              height: 5.0.h,
            ),
            SfSlider(
              min: 0.0,
              max: 5.0,
              value: _value,
              interval: 1,
              showTicks: false,
              showLabels: true,
              enableTooltip: false,
              minorTicksPerInterval: 1,
              onChanged: (dynamic value) {
                setState(() {
                  _value = value;
                });
              },
            ),
            SizedBox(
              height: 20.0.h,
            ),
            Stack(
              alignment: Alignment.bottomCenter,
                children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: 320.0,
                  aspectRatio: 10.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
                items: cardList.map((card) {
                  return Builder(builder: (BuildContext context) {
                    return Card(
                      color: Colors.blueAccent,
                      child: card,
                    );
                  });
                }).toList(),
              ),

              AnimatedSmoothIndicator(
                  activeIndex: _currentIndex,
                  count: cardList.length,
                effect: const WormEffect(
                   dotColor :Colors.grey,
                   activeDotColor : AppColors.primary,
                  dotHeight: 16,
                  dotWidth: 16,
                  type: WormType.thin,
                  // strokeWidth: 5,
                ),
              )
            ]),
          ],
        ),
      ),
    );
  }
}
