import 'package:cached_network_image/cached_network_image.dart';
import 'package:colours/colours.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freeland/app/contract/contract_screen.dart';
import 'package:freeland/app/profile/presentation/widgets/read_more.dart';
import 'package:freeland/common/config/theme/src/colors.dart';
import 'package:freeland/common/config/theme/src/styles.dart';
import 'package:freeland/common/widgets/text.dart';
import 'package:go_router/go_router.dart';
import 'package:timeago/timeago.dart' as timeago;

class ProjectOwn extends StatelessWidget {
  ProjectOwn({Key? key}) : super(key: key);

  static Page pageBuilder(BuildContext context, GoRouterState state) {
    return MaterialPage<void>(
      key: state.pageKey,
      child: ProjectOwn(),
    );
  }

  DateTime minAgo = DateTime.now().subtract(const Duration(minutes: 1));
  DateTime dayAgo = DateTime.now().subtract(const Duration(days: 1));
  DateTime monAgo = DateTime.now().subtract(const Duration(days: 1));

  static const routePath = 'projectOwn_screen';
  static const routeName = 'projectOwn_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                bottomRight:
                                    Radius.circular(buttonBorderRadius)))),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18, vertical: 10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  CustomText.titleMedium('UI/UX Design'),
                                  CustomText.bodySmall(
                                    'by Ahmad Ahmad',
                                    style: TextStyle(color: Colours.grey),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Column(
                                children: const [
                                  CustomText.titleSmall('\$200-300',
                                      style: TextStyle(
                                        color: AppColors.primary,
                                      )),
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
                              SizedBox(
                                height: 5.0.h,
                              ),
                              const AppReadMore(
                                  text:
                                      'UI/UX het succes van jouw email campagnes. Begin met het sturen van de juiste boodschap. Vraag een online demo aan en ontdek wat Mopinion voor jou kan betekenen. Online Demo. Maak eigen feedbackforms. Real Time inzichten. Feedback voor Apps. Verhoog conversie. Slimmere dashboards. Feedback voor Websites. Feedback voor Email. Typen: Mopinion voor Websites, Mopinion voor Apps.Verhoog het succes van jouw email campagnes. Begin met het sturen van de juiste boodschapVerhoog het succes van jouw email campagnes. Begin met het sturen van de juiste boodschapVerhoog het succes van jouw email campagnes. Begin met het sturen van de juiste boodschap ')
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
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
            SingleChildScrollView(
              child: Column(
                children: [
                  DefaultTabController(
                    length: 2,
                    child: Column(
                      children: [
                        const TabBar(
                          tabs: [
                            Tab(
                              text: 'Offer',
                            ),
                            Tab(
                              text: 'Comment',
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 300,
                          child: TabBarView(
                            children: [
                              ListView.separated(
                                itemBuilder: (BuildContext context, int index) {
                                  return ListTile(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            elevation: 25,
                                            title: const Text('Ahmad Ahmad'),
                                            content: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: <Widget>[
                                                const Text(
                                                  'I can submit a good and serious offer to start the project directly for a period of 3 months, with accuracy and skill at work, and a salary of 300  ',
                                                  style: TextStyle(
                                                      color: AppColors.grey2,
                                                      fontSize: 14),
                                                ),
                                                SizedBox(
                                                  height: 10.0.h,
                                                ),
                                                const Text(
                                                  'Would you like to approve of this message?',
                                                  style: TextStyle(
                                                      color: AppColors.primary,
                                                      fontSize: 18),
                                                ),
                                              ],
                                            ),
                                            actions: <Widget>[
                                              TextButton(
                                                child: const Text(
                                                  'Approve',
                                                  style: TextStyle(
                                                      color: AppColors.primary),
                                                ),
                                                onPressed: () {
                                                  context.pushNamed(ContractScreen.routeName);
                                                },
                                              ),
                                              TextButton(
                                                child: const Text('Cancel',
                                                    style: TextStyle(
                                                        color:
                                                            AppColors.grey2)),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    leading: GestureDetector(
                                      onTap: () async {
                                        // Display the image in large form.
                                      },
                                      child: Container(
                                        height: 50.0,
                                        width: 50.0,
                                        decoration: const BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(50))),
                                        child: const CircleAvatar(
                                            radius: 50,
                                            backgroundImage: NetworkImage(
                                                "https://picsum.photos/300/30")),
                                      ),
                                    ),
                                    title: const Text(
                                      'Ahmad Ahmad',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    subtitle: const CustomText.bodySmall(
                                        'Ahmad Ahmad \$400-700  we have project Ahmad Ahmad we have project Ahmad Ahmad \$400-700  we have projectAhmad Ahmad \$400-700  we have projectAhmad Ahmad \$400-700  we have projectAhmad Ahmad \$400-700  we have projectAhmad Ahmad \$400-700  we have projectAhmad Ahmad \$400-700  we have projectAhmad Ahmad \$400-700  we have projectAhmad Ahmad \$400-700  we have projectAhmad Ahmad \$400-700  we have projectAhmad Ahmad \$400-700  we have projectAhmad Ahmad \$400-700  we have projectAhmad Ahmad \$400-700  we have projectAhmad Ahmad \$400-700  we have projectAhmad Ahmad \$400-700  we have projectAhmad Ahmad \$400-700  we have projectAhmad Ahmad \$400-700  we have projectAhmad Ahmad \$400-700  we have projectAhmad Ahmad \$400-700  we have projectAhmad Ahmad \$400-700  we have projectAhmad Ahmad \$400-700  we have projectAhmad Ahmad \$400-700  we have projectAhmad Ahmad \$400-700  we have projectAhmad Ahmad \$400-700  we have project',
                                        style: TextStyle(
                                          color: AppColors.grey2,
                                        ),
                                        maxLines: 1,
                                        textOverflow: TextOverflow.ellipsis),
                                    trailing: Text(
                                        timeago.format(minAgo,
                                            locale: 'en_short'),
                                        style: const TextStyle(fontSize: 11)),
                                  );
                                },
                                separatorBuilder: (context, index) => SizedBox(
                                  width: 7.0.w,
                                ),
                                itemCount: 10,
                                physics: const BouncingScrollPhysics(),
                              ),
                              ListView.separated(
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  return ListTile(
                                    leading: GestureDetector(
                                      onTap: () async {
                                        // Display the image in large form.
                                      },
                                      child: Container(
                                        height: 50.0,
                                        width: 50.0,
                                        decoration: const BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(50))),
                                        child: const CircleAvatar(
                                            radius: 50,
                                            backgroundImage:
                                                CachedNetworkImageProvider(
                                                    "https://picsum.photos/300/30")),
                                      ),
                                    ),
                                    title: const Text(
                                      'Ahmad Ahmad',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    subtitle: const Text('i can offer you..'),
                                    trailing: Text(
                                      timeago.format(
                                        minAgo,
                                        locale: 'en_short',
                                      ),
                                      style: const TextStyle(fontSize: 11),
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) => SizedBox(
                                  width: 7.0.w,
                                ),
                                itemCount: 5,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
