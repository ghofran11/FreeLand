import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:colours/colours.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freeland/app/auth/presentation/sign_up/sign_up_screen.dart';
import 'package:freeland/app/home/presentation/ui/screen/tips_screen.dart';
import 'package:freeland/app/job/presentation/ui/screen/job_screen.dart';
import 'package:freeland/common/widgets/text.dart';
import 'package:freeland/common/widgets/text_field.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../common/config/theme/src/colors.dart';
import '../../../../../common/config/theme/src/styles.dart';
import '../../../../../generated/assets.dart';
import '../widget/tip.dart';

final Tip tips = Tip();

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchForm = FormGroup(
      {
        "searchKey": FormControl<String>(validators: []),
      },
    );

    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalAppPadding.w),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                context.pushNamed(SignUpScreen.routeName);
                },
                icon: const FaIcon(
                  FontAwesomeIcons.searchengin,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              const CustomText.titleMedium(
                "Hello,Adam1",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          ReactiveForm(
            formGroup: searchForm,
            child: CustomReactiveTextField(
              formControlName: 'searchKey',
              labelText: 'Search',
              keyboardType: TextInputType.text,
              suffixIcon:
                  FaIcon(FontAwesomeIcons.magnifyingGlass, size: 18.0.r),
            ),
          ),
          SizedBox(
            height: 22.0.h,
          ),
          const CustomText.titleMedium('Tips for you',
              style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(
            height: 12.0.h,
          ),
          CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 2.0,
                enlargeCenterPage: true,
                autoPlay: true,
              ),
              items: _items(context)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomText.titleMedium('Job Recommendations',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              TextButton(
                child: const CustomText.bodySmall('See All',
                    style: TextStyle(color: AppColors.primary)),
                onPressed: () {},
              ),
            ],
          ),
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: Row(
                children: const [
                  Chip(
                    label: Text("All Job"),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Chip(
                    label: Text("Design"),
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Chip(
                    label: Text("Full-Stack"),
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Chip(
                    label: Text("Front End"),
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Chip(
                    label: Text("Writer"),
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Chip(
                    label: Text("Mobile App"),
                  ),
                ],
              )),
          ListView.separated(
            separatorBuilder: (context, index) => SizedBox(
              height: 8.0.h,
            ),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  context.pushNamed(JobScreen.routeName);
                },
                child: Card(
                  color: Colours.white,
                  // color: Colors.white.withOpacity(0.8)
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        CustomText.titleMedium('Ahmad Ahmad'),
                        SizedBox(
                          height: 3,
                        ),
                        CustomText.labelMedium(' \$400-700'),
                        CustomText.labelMedium(
                            'Ahmad Ahmad \$400-700  we have project Ahmad Ahmad we have project Ahmad Ahmad \$400-700  we have projectAhmad Ahmad \$400-700  we have projectAhmad Ahmad \$400-700  we have projectAhmad Ahmad \$400-700  we have projectAhmad Ahmad \$400-700  we have projectAhmad Ahmad \$400-700  we have projectAhmad Ahmad \$400-700  we have projectAhmad Ahmad \$400-700  we have projectAhmad Ahmad \$400-700  we have projectAhmad Ahmad \$400-700  we have projectAhmad Ahmad \$400-700  we have projectAhmad Ahmad \$400-700  we have projectAhmad Ahmad \$400-700  we have projectAhmad Ahmad \$400-700  we have projectAhmad Ahmad \$400-700  we have projectAhmad Ahmad \$400-700  we have projectAhmad Ahmad \$400-700  we have projectAhmad Ahmad \$400-700  we have projectAhmad Ahmad \$400-700  we have projectAhmad Ahmad \$400-700  we have projectAhmad Ahmad \$400-700  we have projectAhmad Ahmad \$400-700  we have projectAhmad Ahmad \$400-700  we have project',
                            maxLines: 1,
                            textOverflow: TextOverflow.ellipsis),
                      ],
                    ),
                  ),
                ),
              );
            },
            itemCount: 4,
          ),
        ],
      ),
    ));
  }

  _items(BuildContext context) {
    List<Widget> list = [];
    for (int i = 0; i < tips.imgList.length; i++) {
      list.add(Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: CachedNetworkImageProvider(tips.imgList[i])),
              borderRadius:
                  const BorderRadius.all(Radius.circular(buttonBorderRadius))),
          child: InkWell(
            onTap: () {
              context.pushNamed(TipsScreen.routeName, extra: i);
            },
            child: Container(
              color: AppColors.grey.withOpacity(0.1),
            ),
          )));
    }
    return list;
  }
}
