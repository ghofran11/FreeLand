import 'package:cached_network_image/cached_network_image.dart';
import 'package:colours/colours.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freeland/app/contract/contract_screen.dart';
import 'package:freeland/common/config/theme/src/colors.dart';
import 'package:freeland/common/config/theme/src/styles.dart';
import 'package:freeland/common/widgets/currency_symbo.dart';
import 'package:freeland/common/widgets/text.dart';
import 'package:freeland/contact/contact_us.dart';
import 'package:go_router/go_router.dart';

class PendingProject extends StatelessWidget {
  const PendingProject({Key? key}) : super(key: key);

  static Page pageBuilder(BuildContext context, GoRouterState state) {
    return MaterialPage<void>(
      key: state.pageKey,
      child: const PendingProject(),
    );
  }

  static const routePath = 'pending_project';
  static const routeName = 'pending_project';

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
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: CachedNetworkImageProvider(
                            "https://www.mindinventory.com/blog/wp-content/uploads/2021/08/app-ui-ux-design.png")),
                    borderRadius: BorderRadius.only(
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
                        children: const [
                          CustomText.titleMedium("widget.service.name"),
                          CustomText.bodySmall(
                            " widget.service.nameOwner",
                            style: TextStyle(color: Colours.grey),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        children: [
                          Row(
                            children: const [
                              CustomText.labelMedium(
                                " 20",
                                style:
                                    TextStyle(color: AppColors.primary),
                              ),
                              CurrencySymbol(
                                color: AppColors.primary,
                              ),
                              CustomText.labelMedium('-'),
                              CustomText.labelMedium(" 10",
                                  style: TextStyle(
                                      color: AppColors.primary)),
                              CurrencySymbol(
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
                      CustomText.bodyMedium("widget.service.description"),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(color: AppColors.black),

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: CustomText.bodyMedium("You have send to Ali Approve "),
            ),
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
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          CustomText.titleSmall(
                            "Ali asad",
                            style: TextStyle(color: AppColors.grey2),
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
          bottom: 20,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              // style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green),),
              onPressed: () {
                context.pushNamed(ContractScreen.routeName);
              },
              child: const CustomText.bodyMedium(
                'Write your contract',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        )
      ],
    ));
  }
}
