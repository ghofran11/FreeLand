import 'package:bot_toast/bot_toast.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:colours/colours.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freeland/app/contract/contract_screen.dart';
import 'package:freeland/app/profile/presentation/widgets/read_more.dart';
import 'package:freeland/app/projects/presentation/state/bloc/project_bloc.dart';
import 'package:freeland/app/projects/presentation/state/bloc/project_event.dart';
import 'package:freeland/app/projects/presentation/state/bloc/project_state.dart';
import 'package:freeland/common/config/theme/src/colors.dart';
import 'package:freeland/common/config/theme/src/styles.dart';
import 'package:freeland/common/constant/src/strings.dart';
import 'package:freeland/common/widgets/currency_symbo.dart';
import 'package:freeland/common/widgets/loading_progress.dart';
import 'package:freeland/common/widgets/text.dart';
import 'package:freeland/injection/injection.dart';
import 'package:go_router/go_router.dart';
import 'package:timeago/timeago.dart' as timeago;

class ProjectOwn extends StatelessWidget {
  ProjectOwn({Key? key,required this.idProject}) : super(key: key);
final String idProject;
  static Page pageBuilder(BuildContext context, GoRouterState state) {
    return MaterialPage<void>(
      key: state.pageKey,
      child: ProjectOwn(
        idProject: state.extra as String,
      ),
    );
  }



  static const routePath = 'projectOwn_screen';
  static const routeName = 'projectOwn_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create:(context)=> getIt<ProjectBloc>()..add(FetchDetailProjects(idProject: idProject)),
        child: SingleChildScrollView(
          child: BlocConsumer<ProjectBloc,ProjectState>(
            listener: (context, state){
              if (state.fetchDetailProject.isFail()) {
                BotToast.showText(
                    text: state.fetchDetailProject.error ??
                        AppStrings.defaultErrorMsg);
              }
            },
            builder: (context, state){
              if (state.fetchDetailProject.isSuccess()) {
              final detailProject=context.read<ProjectBloc>().detailServices;
              return Column(
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
                                      children:  [
                                        CustomText.titleMedium(detailProject.name),
                                        CustomText.bodySmall(
                                          detailProject.nameOwner,
                                          style: TextStyle(color: Colours.grey),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                     Row(
                              children: [
                                CustomText.labelMedium(detailProject.minPrice.toString() ,style:const TextStyle(color: AppColors.primary),),
                                const CurrencySymbol(color: AppColors.primary,),
                                const CustomText.labelMedium(' - ' ),
                                CustomText.labelMedium(detailProject.maxPrice. toString(),style:const TextStyle(color: AppColors.primary),),
                                const CurrencySymbol(color: AppColors.primary,),

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
                                     AppReadMore(
                                        text:
                                        detailProject.description)
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
                                                  title:  Text(detailProject.commentDtos![index].offerName),
                                                  content: Column(
                                                    mainAxisSize: MainAxisSize.min,
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                    children: <Widget>[
                                                       Text(
                                                        detailProject.offerDtos![index].text,
                                                        style:const TextStyle(
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
                                          subtitle:  CustomText.bodySmall(
                                            detailProject.offerDtos![index].text,
                                              style:const TextStyle(
                                                color: AppColors.grey2,
                                              ),
                                              maxLines: 1,
                                              textOverflow: TextOverflow.ellipsis),
                                        );
                                      },
                                      separatorBuilder: (context, index) => SizedBox(
                                        width: 7.0.w,
                                      ),
                                      itemCount: detailProject.offerDtos!.length,
                                      physics: const BouncingScrollPhysics(),
                                    ),
                                    ListView.separated(
                                      separatorBuilder: (context, index) {
                                        return const Divider();
                                      },
                                      itemBuilder: (context,index){
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
                                                  backgroundImage: NetworkImage(
                                                      "https://images.unsplash.com/photo-1623366302587-b38b1ddaefd9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cGVyc29uJTIwbG9va2luZyUyMGF0JTIwY2FtZXJhfGVufDB8fDB8fA%3D%3D&w=1000&q=80")),
                                            ),
                                          ),
                                          title:  Text(
                                            detailProject.commentDtos![index].senderName,
                                            style:const TextStyle(fontSize: 15),
                                          ),
                                          subtitle:  CustomText.bodySmall(
                                              detailProject.commentDtos![index].text,
                                              style:const TextStyle(
                                                color: AppColors.grey2,
                                              ),
                                              maxLines: 1,
                                              textOverflow: TextOverflow.ellipsis),
                                        );
                                      },
                                      itemCount:detailProject.commentDtos!.length,
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
              );
              }
              if (state.fetchDetailProject.isFail()) {
                return Text(state.fetchDetailProject.error ??
                    AppStrings.defaultErrorMsg);
              }
              return const LoadingProgress();
            },

          ),
        ),
      ),
    );
  }
}
// children: [
//   ListTile(
//     leading: GestureDetector(
//       onTap: () async {
//         // Display the image in large form.
//       },
//       child: Container(
//         height: 50.0,
//         width: 50.0,
//         decoration: const BoxDecoration(
//             color: Colors.blue,
//             borderRadius: BorderRadius.all(
//                 Radius.circular(50))),
//         child: const CircleAvatar(
//             radius: 50,
//             backgroundImage: NetworkImage(
//                 "https://images.unsplash.com/photo-1623366302587-b38b1ddaefd9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cGVyc29uJTIwbG9va2luZyUyMGF0JTIwY2FtZXJhfGVufDB8fDB8fA%3D%3D&w=1000&q=80")),
//       ),
//     ),
//     title: const Text(
//       'Asad Abart',
//       style: TextStyle(fontSize: 15),
//     ),
//     subtitle: const CustomText.bodySmall(
//         "Sorry, can you clarify the last point? thanks",
//         style: TextStyle(
//           color: AppColors.grey2,
//         ),
//         maxLines: 1,
//         textOverflow: TextOverflow.ellipsis),
//     trailing: Text(
//         timeago.format(minAgo, locale: 'en_short'),
//         style: const TextStyle(fontSize: 11)),
//   ),
//   const Divider(),
//   ListTile(
//     onTap: () {},
//     leading: GestureDetector(
//       onTap: () async {
//         // Display the image in large form.
//       },
//       child: Container(
//         height: 50.0,
//         width: 50.0,
//         decoration: const BoxDecoration(
//             color: Colors.blue,
//             borderRadius: BorderRadius.all(
//                 Radius.circular(50))),
//         child: const CircleAvatar(
//             radius: 50,
//             backgroundImage: NetworkImage(
//               "https://image.shutterstock.com/image-photo/young-handsome-man-beard-wearing-260nw-1768126784.jpg",
//             )),
//       ),
//     ),
//     title: const Text(
//       'Yaser Ali',
//       style: TextStyle(fontSize: 15),
//     ),
//     subtitle: const CustomText.bodySmall(
//         'All best,good luck',
//         style: TextStyle(
//           color: AppColors.grey2,
//         ),
//         maxLines: 2,
//         textOverflow: TextOverflow.ellipsis),
//     trailing: Text(
//         timeago.format(minAgo, locale: 'en_short'),
//         style: const TextStyle(fontSize: 11)),
//   ),
//   const Divider(),
//   ListTile(
//     onTap: () {},
//     leading: GestureDetector(
//       onTap: () async {
//         // Display the image in large form.
//       },
//       child: Container(
//         height: 50.0,
//         width: 50.0,
//         decoration: const BoxDecoration(
//             color: Colors.blue,
//             borderRadius: BorderRadius.all(
//                 Radius.circular(50))),
//         child: const CircleAvatar(
//             radius: 50,
//             backgroundImage: NetworkImage(
//                 "https://st.depositphotos.com/1005858/1815/i/600/depositphotos_18158781-stock-photo-good-guy-portrait.jpg")),
//       ),
//     ),
//     title: const Text(
//       'Zaid AlMouhmad',
//       style: TextStyle(fontSize: 15),
//     ),
//     subtitle: const CustomText.bodySmall(
//         'Good luck, I hope you find a freelancer as soon as possible. ',
//         style: TextStyle(
//           color: AppColors.grey2,
//         ),
//         maxLines: 2,
//         textOverflow: TextOverflow.ellipsis),
//     trailing: Text(
//         timeago.format(minAgo, locale: 'en_short'),
//         style: const TextStyle(fontSize: 11)),
//   ),
//   const Divider(),
//   ListTile(
//     onTap: () {},
//     leading: GestureDetector(
//       onTap: () async {
//         // Display the image in large form.
//       },
//       child: Container(
//         height: 50.0,
//         width: 50.0,
//         decoration: const BoxDecoration(
//             color: Colors.blue,
//             borderRadius: BorderRadius.all(
//                 Radius.circular(50))),
//         child: const CircleAvatar(
//             radius: 50,
//             backgroundImage: NetworkImage(
//                 "https://images.unsplash.com/flagged/photo-1570612861542-284f4c12e75f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80")),
//       ),
//     ),
//     title: const Text(
//       'Adam Aouad',
//       style: TextStyle(fontSize: 15),
//     ),
//     subtitle: const CustomText.bodySmall(
//         'shared a post:We want a designer and programmer to make a program about the flower lab for a private lab for a period of 5 months',
//         style: TextStyle(
//           color: AppColors.grey2,
//         ),
//         maxLines: 2,
//         textOverflow: TextOverflow.ellipsis),
//     trailing: Text(
//         timeago.format(minAgo, locale: 'en_short'),
//         style: const TextStyle(fontSize: 11)),
//   ),
//   const Divider(),
//   ListTile(
//     onTap: () {},
//     leading: GestureDetector(
//       onTap: () async {
//         // Display the image in large form.
//       },
//       child: Container(
//         height: 50.0,
//         width: 50.0,
//         decoration: const BoxDecoration(
//             color: Colors.blue,
//             borderRadius: BorderRadius.all(
//                 Radius.circular(50))),
//         child: const CircleAvatar(
//             radius: 50,
//             backgroundImage: NetworkImage(
//                 "https://i.pinimg.com/236x/47/dc/2f/47dc2fd60f0e7724d503ad5e635884ac.jpg")),
//       ),
//     ),
//     title: const Text(
//       'Jood Mosa',
//       style: TextStyle(fontSize: 15),
//     ),
//     subtitle: const CustomText.bodySmall(
//         "joud send to you  offer on Post UI/UX design :you have 14 offer ",
//         style: TextStyle(
//           color: AppColors.grey2,
//         ),
//         maxLines: 2,
//         textOverflow: TextOverflow.ellipsis),
//     trailing: Text(
//         timeago.format(minAgo, locale: 'en_short'),
//         style: const TextStyle(fontSize: 11)),
//   ),
//   const Divider(),
//   ListTile(
//     onTap: () {},
//     leading: GestureDetector(
//       onTap: () async {
//         // Display the image in large form.
//       },
//       child: Container(
//         height: 50.0,
//         width: 50.0,
//         decoration: const BoxDecoration(
//             color: Colors.blue,
//             borderRadius: BorderRadius.all(
//                 Radius.circular(50))),
//         child: const CircleAvatar(
//             radius: 50,
//             backgroundImage: NetworkImage(
//                 "https://images.unsplash.com/photo-1547425260-76bcadfb4f2c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80")),
//       ),
//     ),
//     title: const Text(
//       'Omar Asad',
//       style: TextStyle(fontSize: 15),
//     ),
//     subtitle: const CustomText.bodySmall(
//         "People with similar interest are offer on post front end Project ",
//         style: TextStyle(
//           color: AppColors.grey2,
//         ),
//         maxLines: 2,
//         textOverflow: TextOverflow.ellipsis),
//     trailing: Text(
//         timeago.format(minAgo, locale: 'en_short'),
//         style: const TextStyle(fontSize: 11)),
//   ),
//   const Divider(),
// ],