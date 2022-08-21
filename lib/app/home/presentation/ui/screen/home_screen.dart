import 'package:bot_toast/bot_toast.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freeland/app/home/presentation/state/bloc/home_bloc.dart';
import 'package:freeland/app/home/presentation/ui/screen/tips_screen.dart';
import 'package:freeland/app/home/presentation/ui/widget/drawer.dart';
import 'package:freeland/app/home/presentation/ui/widget/job_card.dart';
import 'package:freeland/common/constant/src/strings.dart';
import 'package:freeland/common/widgets/loading_progress.dart';
import 'package:freeland/common/widgets/text.dart';
import 'package:freeland/common/widgets/text_field.dart';
import 'package:freeland/core/user/provider/user_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../common/config/theme/src/colors.dart';
import '../../../../../common/config/theme/src/styles.dart';
import '../widget/tip.dart';
import 'searsh_users_screen.dart';

final Tip tips = Tip();

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  final _refreshController = RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    final searchForm = FormGroup(
      {
        "searchKey": FormControl<String>(validators: []),
      },
    );
    return SmartRefresher(
      controller: _refreshController,
      onRefresh: () {
        context.read<HomeBloc>().add(FetchAllCategory());
      },
      child: Scaffold(
          backgroundColor: AppColors.background,
          body: SliderDrawer(
            key: _key,
            appBar: SliderAppBar(
              appBarColor: AppColors.background,
              isTitleCenter: false,
              drawerIconColor: AppColors.primary,
              title: Text(
                  'Hello ${context.read<UserProvider>().user?.fullName} !'),
            ),
            slider: const DrawerScreen(),
            child: Container(
              color: AppColors.background,
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Builder(builder: (context) {
                          return ReactiveForm(
                            formGroup: searchForm,
                            child: CustomReactiveTextField(
                              onTap: () {
                                context.pushNamed(SearchUsersScreen.routeName,
                                    extra: context.read<HomeBloc>().users);
                                print(context.read<HomeBloc>().users);
                              },
                              formControlName: 'searchKey',
                              labelText: 'Search',
                              keyboardType: TextInputType.text,
                              readOnly: true,
                              suffixIcon: FaIcon(
                                  FontAwesomeIcons.magnifyingGlass,
                                  size: 18.0.r),
                            ),
                          );
                        }),
                        SizedBox(
                          height: 16.0.h,
                        ),
                        const CustomText.titleMedium('Tips for you',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CarouselSlider(
                        options: CarouselOptions(
                          aspectRatio: 2.3,
                          enlargeCenterPage: true,
                          autoPlay: true,
                          viewportFraction: 1.0,
                        ),
                        items: _items(context)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CustomText.titleMedium('Latest Projects',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextButton(
                          child: const CustomText.bodySmall('See All',
                              style: TextStyle(color: AppColors.primary)),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  BlocConsumer<HomeBloc, HomeState>(listener: (context, state) {
                    if (state.categoryStatus.isFail()) {
                      BotToast.showText(
                          text: state.categoryStatus.error ??
                              AppStrings.defaultErrorMsg);
                    }
                    if (!state.categoryStatus.isLoading()) {
                      _refreshController.refreshCompleted();
                    }
                  }, builder: (context, state) {
                    final HomeBloc homeBloc = context.read<HomeBloc>();
                    return Column(
                      children: [
                        //Categories
                        (state.categoryStatus.isSuccess())
                            ? Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: SizedBox(
                                  height: 30,
                                  child: ListView(
                                    children: List.generate(
                                        homeBloc.categories.length,
                                        (index) => Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 8.0),
                                              child: InkWell(
                                                child: Chip(
                                                  padding: EdgeInsets.zero,
                                                  label: Text(
                                                    homeBloc
                                                        .categories[index].name,
                                                    style: const TextStyle(
                                                        fontSize: 12),
                                                  ),
                                                ),
                                                onTap: () {
                                                  homeBloc.add(FetchAllService(
                                                      id: homeBloc
                                                          .categories[index]
                                                          .id));
                                                },
                                              ),
                                            )),
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                  ),
                                ),
                              )
                            : (state.categoryStatus.isFail())
                                ? Text(state.categoryStatus.error ??
                                    AppStrings.defaultErrorMsg)
                                : const LoadingProgress(),
                        SizedBox(
                          height: 16.0.h,
                        ),

                        ///Services
                        Builder(builder: (context) {
                          if (state.serviceStatus.isSuccess()) {
                            final _services = homeBloc.services;
                            return homeBloc.services.isNotEmpty
                                ? ListView.separated(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8.0.w),
                                    separatorBuilder: (context, index) =>
                                        SizedBox(
                                      height: 8.0.h,
                                    ),
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return JobCard(service: _services[index]);
                                    },
                                    itemCount: _services.length,
                                  )
                                : const CustomText.bodyMedium(
                                    'No posted projects in the category you have selected');
                          } else if (state.serviceStatus.isFail()) {
                            return Text(state.serviceStatus.error ??
                                AppStrings.defaultErrorMsg);
                          } else if (state.serviceStatus.isLoading()) {
                            return const LoadingProgress();
                          }
                          return Container();
                        }),
                      ],
                    );
                  }),
                ],
              ),
            ),
          )),
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
