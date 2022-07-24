import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:colours/colours.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freeland/app/auth/presentation/sign_up/sign_up_screen.dart';
import 'package:freeland/app/home/presentation/ui/screen/tips_screen.dart';
import 'package:freeland/app/home/presentation/ui/widget/job_card.dart';
import 'package:freeland/app/projects/presentation/ui/screen/project_detail.dart';
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
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
              ],
            ),
          ),
          CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 2.0,
                enlargeCenterPage: true,
                autoPlay: true,
              ),
              items: _items(context)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
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
          ),
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 1),
              child: Row(
                children: const [
                  SizedBox(
                    width: 2,
                  ),
                  Chip(
                    padding: EdgeInsets.zero,
                    label: Text(
                      "All Job",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Chip(
                    padding: EdgeInsets.zero,
                    label: Text(
                      "Design",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Chip(
                    padding: EdgeInsets.zero,
                    label: Text(
                      "Full Stack",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Chip(
                    padding: EdgeInsets.zero,
                    label: Text(
                      "back",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Chip(
                    padding: EdgeInsets.zero,
                    label: Text(
                      "witter",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Chip(
                    padding: EdgeInsets.zero,
                    label: Text(
                      "Mobile App",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              )),
          ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 12.0.h),
            separatorBuilder: (context, index) => SizedBox(
              height: 8.0.h,
            ),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return const JobCard();
            },
            itemCount: 4,
          ),
        ],
      ),
    );
  }

  _items(BuildContext context) {
    List<Widget> list = [];
    for (int i = 0; i < tips.imgList.length; i++) {
      list.add(
        Container(
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
          ),
        ),
      );
    }
    return list;
  }
}
