import 'package:bot_toast/bot_toast.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freeland/app/notifications/infrastructure/models/notification.dart';
import 'package:freeland/app/notifications/infrastructure/models/send_response_params.dart';
import 'package:freeland/app/notifications/presentation/state/notification_bloc.dart';
import 'package:freeland/app/notifications/presentation/state/notification_event.dart';
import 'package:freeland/app/notifications/presentation/state/notification_state.dart';
import 'package:freeland/app/profile/presentation/widgets/read_more.dart';
import 'package:freeland/common/config/theme/src/colors.dart';
import 'package:freeland/common/constant/src/strings.dart';
import 'package:freeland/common/widgets/loading_progress.dart';
import 'package:freeland/common/widgets/text.dart';
import 'package:freeland/common/widgets/text_field.dart';
import 'package:freeland/contact/contact_us.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../injection/injection.dart';

class NotificationsPage extends StatelessWidget {
  NotificationsPage({Key? key}) : super(key: key);
  DateTime minAgo = DateTime.now().subtract(const Duration(minutes: 1));

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<NotificationBloc>()..add(FetchAllNotification()),
      child: Scaffold(
          body: Center(
        child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    const TabBar(
                      tabs: [
                        Tab(
                          text: 'Notification',
                        ),
                        Tab(
                          text: 'Invitations',
                        ),
                      ],
                    ),
                    BlocConsumer<NotificationBloc, NotificationState>(
                      listener: (context, state) {
                        if(state.notificationStatus.isFail()){
                          BotToast.showText(
                              text: state.notificationStatus.error ??
                                  AppStrings.defaultErrorMsg);
                        }

                      },
                      builder: (context, state) {
                        NotificationBloc _notificationBloc=context.read<NotificationBloc>();
                        //toDo
                        List<NotificationDto> notification = _notificationBloc.notification;
                        return Expanded(
                          child: TabBarView(children: [
                           Builder(builder: (context){
                             if(state.notificationStatus.isSuccess()){
                               final notifications =_notificationBloc.notification;
                               return  ListView.separated(
                                 separatorBuilder:
                                     (BuildContext context, int index) {
                                   return const Divider();
                                 },
                                 itemBuilder: (BuildContext context, int index) {
                                   return ListTile(
                                     onTap: () {},
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
                                               "https://image.shutterstock.com/image-photo/young-handsome-man-beard-wearing-260nw-1768126784.jpg",
                                             )),
                                       ),
                                     ),
                                     title:  Text(
                                       notifications[index].title,
                                       style:const TextStyle(fontSize: 15),
                                     ),
                                     subtitle:  CustomText.bodySmall(
                                         notifications[index].body ,
                                         style: TextStyle(
                                           color: AppColors.grey2,
                                         ),
                                         maxLines: 2,
                                         textOverflow: TextOverflow.ellipsis),
                                     trailing: Text(
                                         timeago.format(minAgo,
                                             locale: 'en_short'),
                                         style: const TextStyle(fontSize: 11)),
                                   );
                                 },
                                 itemCount: notifications.length,
                                 physics: const BouncingScrollPhysics(),
                               );
                             }
                             else if (state.notificationStatus.isLoading()) {
                               return const LoadingProgress();
                             }
                             return Container();
                           }),
                            Builder(
                              builder: (context) {
                                if(state.notificationStatus.isSuccess()){
                                  return ListView.separated(
                                    separatorBuilder: (context, index) {
                                      return const Divider();
                                    },
                                    itemBuilder: (context,index){
                                      return ListTile(
                                          onTap: () {},
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
                                                      "https://media.istockphoto.com/photos/happy-male-executive-in-office-picture-id1208414307?k=20&m=1208414307&s=612x612&w=0&h=6_K-g8mu8VMCh0TX3F4q3VORaFK_7tJD3PzubGHwdZs=")),
                                            ),
                                          ),
                                          title: const Text(
                                            'Sami Salok',
                                            style: TextStyle(fontSize: 15),
                                          ),
                                          subtitle: const CustomText.bodySmall(
                                              'UI Designer at Splendapp',
                                              style: TextStyle(
                                                color: AppColors.grey2,
                                              ),
                                              maxLines: 2,
                                              textOverflow: TextOverflow.ellipsis),
                                          trailing: Builder(
                                            builder: (context) {
                                              if(state.responseStatus.isFail()){
                                                BotToast.showText(
                                                    text: state.responseStatus.error ??
                                                        AppStrings.defaultErrorMsg);
                                                return Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    InkWell(

                                                      child: const FaIcon(
                                                        FontAwesomeIcons.circleCheck,
                                                        size: 30,
                                                        color: AppColors.primary,
                                                      ),
                                                      onTap: (){
                                                        _notificationBloc.add(ResponseConnection(param: SendResponseParam(isAccepted: true,id: "ghhh")));

                                                      },
                                                    ),
                                                    SizedBox(
                                                      width: 5.0.h,
                                                    ),
                                                    InkWell(
                                                      child: const FaIcon(
                                                        FontAwesomeIcons.circleXmark,
                                                        size: 30,
                                                        color: AppColors.grey2,
                                                      ),
                                                      onTap: (){
                                                        _notificationBloc.add(ResponseConnection(param: SendResponseParam(isAccepted: true,id: "ghhh")));
                                                      },
                                                    ),
                                                  ],
                                                );
                                              }
                                            else  if(state.responseStatus.isSuccess()){
                                                BotToast.showText(
                                                    text: 'Request approved ');
                                              }
                                              return Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  InkWell(
                                                    child: const FaIcon(
                                                      FontAwesomeIcons.circleCheck,
                                                      size: 30,
                                                      color: AppColors.primary,
                                                    ),
                                                    onTap: (){
                                                      print("ghofran ghofran ture trueeee");
                                                    },
                                                  ),
                                                ],
                                              );
                                            }
                                          ));
                                    },
                                    itemCount: 8,
                                  );
                                }
                                else if (state.notificationStatus.isLoading()) {
                                  return const LoadingProgress();
                                }
                                return Container();
                              }
                            ),
                          ]),
                        );
                      },
                    ),
                  ],
                ))),
      )),
    );
  }
}
// ListTile(
//   onTap: () {
//     context.pushNamed(ContactUs.routeName);
//   },
//   leading: GestureDetector(
//     onTap: () async {
//       // Display the image in large form.
//     },
//     child: Container(
//       height: 50.0,
//       width: 50.0,
//       decoration: const BoxDecoration(
//           color: Colors.blue,
//           borderRadius: BorderRadius.all(
//               Radius.circular(50))),
//       child: const CircleAvatar(
//           radius: 50,
//           backgroundImage: NetworkImage(
//               "https://images.unsplash.com/photo-1623366302587-b38b1ddaefd9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cGVyc29uJTIwbG9va2luZyUyMGF0JTIwY2FtZXJhfGVufDB8fDB8fA%3D%3D&w=1000&q=80")),
//     ),
//   ),
//   title: const Text(
//     'Ahmad Ahmad',
//     style: TextStyle(fontSize: 15),
//   ),
//   subtitle: const CustomText.bodySmall(
//       'shared a post:I want a designer to design billboards about a new institute that has been opened for two weeks. The institute includes the primary classes ',
//       style: TextStyle(
//         color: AppColors.grey2,
//       ),
//       maxLines: 2,
//       textOverflow: TextOverflow.ellipsis),
//   trailing: Text(
//       timeago.format(minAgo, locale: 'en_short'),
//       style: const TextStyle(fontSize: 11)),
// ),
// ListTile(
//   onTap: () {},
//   leading: GestureDetector(
//     onTap: () async {
//       // Display the image in large form.
//     },
//     child: Container(
//       height: 50.0,
//       width: 50.0,
//       decoration: const BoxDecoration(
//           color: Colors.blue,
//           borderRadius: BorderRadius.all(
//               Radius.circular(50))),
//       child: const CircleAvatar(
//           radius: 50,
//           backgroundImage: NetworkImage(
//               "https://st.depositphotos.com/1005858/1815/i/600/depositphotos_18158781-stock-photo-good-guy-portrait.jpg")),
//     ),
//   ),
//   title: const Text(
//     'Zaid AlMouhmad',
//     style: TextStyle(fontSize: 15),
//   ),
//   subtitle: const CustomText.bodySmall(
//       "zaid have send to you comment on post UI/UX design :you have 21 comments inform you reply ",
//       style: TextStyle(
//         color: AppColors.grey2,
//       ),
//       maxLines: 2,
//       textOverflow: TextOverflow.ellipsis),
//   trailing: Text(
//       timeago.format(minAgo, locale: 'en_short'),
//       style: const TextStyle(fontSize: 11)),
// ),
// const Divider(),
// ListTile(
//   onTap: () {},
//   leading: GestureDetector(
//     onTap: () async {
//       // Display the image in large form.
//     },
//     child: Container(
//       height: 50.0,
//       width: 50.0,
//       decoration: const BoxDecoration(
//           color: Colors.blue,
//           borderRadius: BorderRadius.all(
//               Radius.circular(50))),
//       child: const CircleAvatar(
//           radius: 50,
//           backgroundImage: NetworkImage(
//               "https://images.unsplash.com/flagged/photo-1570612861542-284f4c12e75f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80")),
//     ),
//   ),
//   title: const Text(
//     'Adam Aouad',
//     style: TextStyle(fontSize: 15),
//   ),
//   subtitle: const CustomText.bodySmall(
//       'shared a post:We want a designer and programmer to make a program about the flower lab for a private lab for a period of 5 months',
//       style: TextStyle(
//         color: AppColors.grey2,
//       ),
//       maxLines: 2,
//       textOverflow: TextOverflow.ellipsis),
//   trailing: Text(
//       timeago.format(minAgo, locale: 'en_short'),
//       style: const TextStyle(fontSize: 11)),
// ),
// const Divider(),
// ListTile(
//   onTap: () {},
//   leading: GestureDetector(
//     onTap: () async {
//       // Display the image in large form.
//     },
//     child: Container(
//       height: 50.0,
//       width: 50.0,
//       decoration: const BoxDecoration(
//           color: Colors.blue,
//           borderRadius: BorderRadius.all(
//               Radius.circular(50))),
//       child: const CircleAvatar(
//           radius: 50,
//           backgroundImage: NetworkImage(
//               "https://i.pinimg.com/236x/47/dc/2f/47dc2fd60f0e7724d503ad5e635884ac.jpg")),
//     ),
//   ),
//   title: const Text(
//     'Jood Mosa',
//     style: TextStyle(fontSize: 15),
//   ),
//   subtitle: const CustomText.bodySmall(
//       "joud send to you  offer on Post UI/UX design :you have 14 offer ",
//       style: TextStyle(
//         color: AppColors.grey2,
//       ),
//       maxLines: 2,
//       textOverflow: TextOverflow.ellipsis),
//   trailing: Text(
//       timeago.format(minAgo, locale: 'en_short'),
//       style: const TextStyle(fontSize: 11)),
// ),
// const Divider(),
// ListTile(
//   onTap: () {},
//   leading: GestureDetector(
//     onTap: () async {
//       // Display the image in large form.
//     },
//     child: Container(
//       height: 50.0,
//       width: 50.0,
//       decoration: const BoxDecoration(
//           color: Colors.blue,
//           borderRadius: BorderRadius.all(
//               Radius.circular(50))),
//       child: const CircleAvatar(
//           radius: 50,
//           backgroundImage: NetworkImage(
//               "https://images.unsplash.com/photo-1547425260-76bcadfb4f2c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80")),
//     ),
//   ),
//   title: const Text(
//     'Omar Asad',
//     style: TextStyle(fontSize: 15),
//   ),
//   subtitle: const CustomText.bodySmall(
//       "People with similar interest are offer on post front end Project ",
//       style: TextStyle(
//         color: AppColors.grey2,
//       ),
//       maxLines: 2,
//       textOverflow: TextOverflow.ellipsis),
//   trailing: Text(
//       timeago.format(minAgo, locale: 'en_short'),
//       style: const TextStyle(fontSize: 11)),
// ),
// const Divider(),
// ListTile(
//   onTap: () {},
//   leading: GestureDetector(
//     onTap: () async {
//       // Display the image in large form.
//     },
//     child: Container(
//       height: 50.0,
//       width: 50.0,
//       decoration: const BoxDecoration(
//           color: Colors.blue,
//           borderRadius: BorderRadius.all(
//               Radius.circular(50))),
//       child: const CircleAvatar(
//           radius: 50,
//           backgroundImage: NetworkImage(
//               "https://i.pinimg.com/236x/47/dc/2f/47dc2fd60f0e7724d503ad5e635884ac.jpg")),
//     ),
//   ),
//   title: const Text(
//     'Jood Mosa',
//     style: TextStyle(fontSize: 15),
//   ),
//   subtitle: const CustomText.bodySmall(
//       "joud send to you  offer on Post UI/UX design :you have 14 offer ",
//       style: TextStyle(
//         color: AppColors.grey2,
//       ),
//       maxLines: 2,
//       textOverflow: TextOverflow.ellipsis),
//   trailing: Text(
//       timeago.format(minAgo, locale: 'en_short'),
//       style: const TextStyle(fontSize: 11)),
// ),
// const Divider(),
// ListTile(
//   onTap: () {},
//   leading: GestureDetector(
//     onTap: () async {
//       // Display the image in large form.
//     },
//     child: Container(
//       height: 50.0,
//       width: 50.0,
//       decoration: const BoxDecoration(
//           color: Colors.blue,
//           borderRadius: BorderRadius.all(
//               Radius.circular(50))),
//       child: const CircleAvatar(
//           radius: 50,
//           backgroundImage: NetworkImage(
//               "https://images.unsplash.com/photo-1547425260-76bcadfb4f2c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80")),
//     ),
//   ),
//   title: const Text(
//     'Omar Asad',
//     style: TextStyle(fontSize: 15),
//   ),
//   subtitle: const CustomText.bodySmall(
//       "People with similar interest are offer on post front end Project ",
//       style: TextStyle(
//         color: AppColors.grey2,
//       ),
//       maxLines: 2,
//       textOverflow: TextOverflow.ellipsis),
//   trailing: Text(
//       timeago.format(minAgo, locale: 'en_short'),
//       style: const TextStyle(fontSize: 11)),
// ),
// const Divider(),
// children: [
//   ListTile(
//       onTap: () {},
//       leading: GestureDetector(
//         onTap: () async {
//           // Display the image in large form.
//         },
//         child: Container(
//           height: 50.0,
//           width: 50.0,
//           decoration: const BoxDecoration(
//               color: Colors.blue,
//               borderRadius: BorderRadius.all(
//                   Radius.circular(50))),
//           child: const CircleAvatar(
//               radius: 50,
//               backgroundImage: NetworkImage(
//                   "https://thumbs.dreamstime.com/b/happy-beautiful-muslim-business-woman-brown-hijab-working-financial-business-report-calculator-home-office-happy-154129258.jpg")),
//         ),
//       ),
//       title: const Text(
//         'Malak yuons',
//         style: TextStyle(fontSize: 15),
//       ),
//       subtitle: const CustomText.bodySmall(
//           'Flutter Developer',
//           style: TextStyle(
//             color: AppColors.grey2,
//           ),
//           maxLines: 2,
//           textOverflow: TextOverflow.ellipsis),
//       trailing: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           const FaIcon(
//             FontAwesomeIcons.circleCheck,
//             size: 30,
//             color: AppColors.primary,
//           ),
//           SizedBox(
//             width: 5.0.h,
//           ),
//           const FaIcon(
//             FontAwesomeIcons.circleXmark,
//             size: 30,
//             color: AppColors.grey2,
//           ),
//         ],
//       )),
//   const Divider(),
//   ListTile(
//       onTap: () {},
//       leading: GestureDetector(
//         onTap: () async {
//           // Display the image in large form.
//         },
//         child: Container(
//           height: 50.0,
//           width: 50.0,
//           decoration: const BoxDecoration(
//               color: Colors.blue,
//               borderRadius: BorderRadius.all(
//                   Radius.circular(50))),
//           child: const CircleAvatar(
//               radius: 50,
//               backgroundImage: NetworkImage(
//                   "https://media.istockphoto.com/photos/happy-male-executive-in-office-picture-id1208414307?k=20&m=1208414307&s=612x612&w=0&h=6_K-g8mu8VMCh0TX3F4q3VORaFK_7tJD3PzubGHwdZs=")),
//         ),
//       ),
//       title: const Text(
//         'Sami Salok',
//         style: TextStyle(fontSize: 15),
//       ),
//       subtitle: const CustomText.bodySmall(
//           'UI Designer at Splendapp',
//           style: TextStyle(
//             color: AppColors.grey2,
//           ),
//           maxLines: 2,
//           textOverflow: TextOverflow.ellipsis),
//       trailing: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           const FaIcon(
//             FontAwesomeIcons.circleCheck,
//             size: 30,
//             color: AppColors.primary,
//           ),
//           SizedBox(
//             width: 5.0.h,
//           ),
//           const FaIcon(
//             FontAwesomeIcons.circleXmark,
//             size: 30,
//             color: AppColors.grey2,
//           ),
//         ],
//       )),
//   const Divider(),
//   ListTile(
//       onTap: () {},
//       leading: GestureDetector(
//         onTap: () async {
//           // Display the image in large form.
//         },
//         child: Container(
//           height: 50.0,
//           width: 50.0,
//           decoration: const BoxDecoration(
//               color: Colors.blue,
//               borderRadius: BorderRadius.all(
//                   Radius.circular(50))),
//           child: const CircleAvatar(
//               radius: 50,
//               backgroundImage: NetworkImage(
//                   "https://media.smallbiztrends.com/2016/12/shutterstock_270757481.jpg")),
//         ),
//       ),
//       title: const Text(
//         'Laila Alaa',
//         style: TextStyle(fontSize: 15),
//       ),
//       subtitle: const CustomText.bodySmall(
//           'HR Generalist',
//           style: TextStyle(
//             color: AppColors.grey2,
//           ),
//           maxLines: 2,
//           textOverflow: TextOverflow.ellipsis),
//       trailing: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           const FaIcon(
//             FontAwesomeIcons.circleCheck,
//             size: 30,
//             color: AppColors.primary,
//           ),
//           SizedBox(
//             width: 5.0.h,
//           ),
//           const FaIcon(
//             FontAwesomeIcons.circleXmark,
//             size: 30,
//             color: AppColors.grey2,
//           ),
//         ],
//       )),
//   const Divider(),
//   ListTile(
//       onTap: () {},
//       leading: GestureDetector(
//         onTap: () async {
//           // Display the image in large form.
//         },
//         child: Container(
//           height: 50.0,
//           width: 50.0,
//           decoration: const BoxDecoration(
//               color: Colors.blue,
//               borderRadius: BorderRadius.all(
//                   Radius.circular(50))),
//           child: const CircleAvatar(
//               radius: 50,
//               backgroundImage: NetworkImage(
//                   "https://t4.ftcdn.net/jpg/02/97/24/51/360_F_297245133_gBPfK0h10UM3y7vfoEiBC3ZXt559KZar.jpg")),
//         ),
//       ),
//       title: const Text(
//         'Jon Aklas',
//         style: TextStyle(fontSize: 15),
//       ),
//       subtitle: const CustomText.bodySmall(
//           'SoftWare Test Engineer',
//           style: TextStyle(
//             color: AppColors.grey2,
//           ),
//           maxLines: 2,
//           textOverflow: TextOverflow.ellipsis),
//       trailing: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           const FaIcon(
//             FontAwesomeIcons.circleCheck,
//             size: 30,
//             color: AppColors.primary,
//           ),
//           SizedBox(
//             width: 5.0.h,
//           ),
//           const FaIcon(
//             FontAwesomeIcons.circleXmark,
//             size: 30,
//             color: AppColors.grey2,
//           ),
//         ],
//       )),
//   const Divider(),
//   ListTile(
//       onTap: () {},
//       leading: GestureDetector(
//         onTap: () async {
//           // Display the image in large form.
//         },
//         child: Container(
//           height: 50.0,
//           width: 50.0,
//           decoration: const BoxDecoration(
//               color: Colors.blue,
//               borderRadius: BorderRadius.all(
//                   Radius.circular(50))),
//           child: const CircleAvatar(
//               radius: 50,
//               backgroundImage: NetworkImage(
//                   "https://t4.ftcdn.net/jpg/04/22/82/39/360_F_422823992_ZtyrE96o6wGTJcyZolZ6pLRUGHBRCH9c.jpg")),
//         ),
//       ),
//       title: const Text(
//         'Yaman Salm',
//         style: TextStyle(fontSize: 15),
//       ),
//       subtitle: const CustomText.bodySmall(
//           'Technical Recruiter',
//           style: TextStyle(
//             color: AppColors.grey2,
//           ),
//           maxLines: 2,
//           textOverflow: TextOverflow.ellipsis),
//       trailing: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           const FaIcon(
//             FontAwesomeIcons.circleCheck,
//             size: 30,
//             color: AppColors.primary,
//           ),
//           SizedBox(
//             width: 5.0.h,
//           ),
//           const FaIcon(
//             FontAwesomeIcons.circleXmark,
//             size: 30,
//             color: AppColors.grey2,
//           ),
//         ],
//       )),
//   const Divider(),
//   ListTile(
//       onTap: () {},
//       leading: GestureDetector(
//         onTap: () async {
//           // Display the image in large form.
//         },
//         child: Container(
//           height: 50.0,
//           width: 50.0,
//           decoration: const BoxDecoration(
//               color: Colors.blue,
//               borderRadius: BorderRadius.all(
//                   Radius.circular(50))),
//           child: const CircleAvatar(
//               radius: 50,
//               backgroundImage: NetworkImage(
//                   "https://media.istockphoto.com/photos/portrait-of-happy-indian-man-smiling-at-home-picture-id1270067432?k=20&m=1270067432&s=170667a&w=0&h=oteWnPwtJfubzHmfGPfTfvrSSTVsLQ3hMP18oxIJaZk=")),
//         ),
//       ),
//       title: const Text(
//         'Jad ALAbed',
//         style: TextStyle(fontSize: 15),
//       ),
//       subtitle: const CustomText.bodySmall(
//           'Senior Machine Learning Engineer',
//           style: TextStyle(
//             color: AppColors.grey2,
//           ),
//           maxLines: 2,
//           textOverflow: TextOverflow.ellipsis),
//       trailing: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           const FaIcon(
//             FontAwesomeIcons.circleCheck,
//             size: 30,
//             color: AppColors.primary,
//           ),
//           SizedBox(
//             width: 5.0.h,
//           ),
//           const FaIcon(
//             FontAwesomeIcons.circleXmark,
//             size: 30,
//             color: AppColors.grey2,
//           ),
//         ],
//       )),
//   const Divider(),
// ],   // children: [
//                                     //   ListTile(
//                                     //       onTap: () {},
//                                     //       leading: GestureDetector(
//                                     //         onTap: () async {
//                                     //           // Display the image in large form.
//                                     //         },
//                                     //         child: Container(
//                                     //           height: 50.0,
//                                     //           width: 50.0,
//                                     //           decoration: const BoxDecoration(
//                                     //               color: Colors.blue,
//                                     //               borderRadius: BorderRadius.all(
//                                     //                   Radius.circular(50))),
//                                     //           child: const CircleAvatar(
//                                     //               radius: 50,
//                                     //               backgroundImage: NetworkImage(
//                                     //                   "https://thumbs.dreamstime.com/b/happy-beautiful-muslim-business-woman-brown-hijab-working-financial-business-report-calculator-home-office-happy-154129258.jpg")),
//                                     //         ),
//                                     //       ),
//                                     //       title: const Text(
//                                     //         'Malak yuons',
//                                     //         style: TextStyle(fontSize: 15),
//                                     //       ),
//                                     //       subtitle: const CustomText.bodySmall(
//                                     //           'Flutter Developer',
//                                     //           style: TextStyle(
//                                     //             color: AppColors.grey2,
//                                     //           ),
//                                     //           maxLines: 2,
//                                     //           textOverflow: TextOverflow.ellipsis),
//                                     //       trailing: Row(
//                                     //         mainAxisSize: MainAxisSize.min,
//                                     //         children: [
//                                     //           const FaIcon(
//                                     //             FontAwesomeIcons.circleCheck,
//                                     //             size: 30,
//                                     //             color: AppColors.primary,
//                                     //           ),
//                                     //           SizedBox(
//                                     //             width: 5.0.h,
//                                     //           ),
//                                     //           const FaIcon(
//                                     //             FontAwesomeIcons.circleXmark,
//                                     //             size: 30,
//                                     //             color: AppColors.grey2,
//                                     //           ),
//                                     //         ],
//                                     //       )),
//                                     //   const Divider(),
//                                     //   ListTile(
//                                     //       onTap: () {},
//                                     //       leading: GestureDetector(
//                                     //         onTap: () async {
//                                     //           // Display the image in large form.
//                                     //         },
//                                     //         child: Container(
//                                     //           height: 50.0,
//                                     //           width: 50.0,
//                                     //           decoration: const BoxDecoration(
//                                     //               color: Colors.blue,
//                                     //               borderRadius: BorderRadius.all(
//                                     //                   Radius.circular(50))),
//                                     //           child: const CircleAvatar(
//                                     //               radius: 50,
//                                     //               backgroundImage: NetworkImage(
//                                     //                   "https://media.istockphoto.com/photos/happy-male-executive-in-office-picture-id1208414307?k=20&m=1208414307&s=612x612&w=0&h=6_K-g8mu8VMCh0TX3F4q3VORaFK_7tJD3PzubGHwdZs=")),
//                                     //         ),
//                                     //       ),
//                                     //       title: const Text(
//                                     //         'Sami Salok',
//                                     //         style: TextStyle(fontSize: 15),
//                                     //       ),
//                                     //       subtitle: const CustomText.bodySmall(
//                                     //           'UI Designer at Splendapp',
//                                     //           style: TextStyle(
//                                     //             color: AppColors.grey2,
//                                     //           ),
//                                     //           maxLines: 2,
//                                     //           textOverflow: TextOverflow.ellipsis),
//                                     //       trailing: Row(
//                                     //         mainAxisSize: MainAxisSize.min,
//                                     //         children: [
//                                     //           const FaIcon(
//                                     //             FontAwesomeIcons.circleCheck,
//                                     //             size: 30,
//                                     //             color: AppColors.primary,
//                                     //           ),
//                                     //           SizedBox(
//                                     //             width: 5.0.h,
//                                     //           ),
//                                     //           const FaIcon(
//                                     //             FontAwesomeIcons.circleXmark,
//                                     //             size: 30,
//                                     //             color: AppColors.grey2,
//                                     //           ),
//                                     //         ],
//                                     //       )),
//                                     //   const Divider(),
//                                     //   ListTile(
//                                     //       onTap: () {},
//                                     //       leading: GestureDetector(
//                                     //         onTap: () async {
//                                     //           // Display the image in large form.
//                                     //         },
//                                     //         child: Container(
//                                     //           height: 50.0,
//                                     //           width: 50.0,
//                                     //           decoration: const BoxDecoration(
//                                     //               color: Colors.blue,
//                                     //               borderRadius: BorderRadius.all(
//                                     //                   Radius.circular(50))),
//                                     //           child: const CircleAvatar(
//                                     //               radius: 50,
//                                     //               backgroundImage: NetworkImage(
//                                     //                   "https://media.smallbiztrends.com/2016/12/shutterstock_270757481.jpg")),
//                                     //         ),
//                                     //       ),
//                                     //       title: const Text(
//                                     //         'Laila Alaa',
//                                     //         style: TextStyle(fontSize: 15),
//                                     //       ),
//                                     //       subtitle: const CustomText.bodySmall(
//                                     //           'HR Generalist',
//                                     //           style: TextStyle(
//                                     //             color: AppColors.grey2,
//                                     //           ),
//                                     //           maxLines: 2,
//                                     //           textOverflow: TextOverflow.ellipsis),
//                                     //       trailing: Row(
//                                     //         mainAxisSize: MainAxisSize.min,
//                                     //         children: [
//                                     //           const FaIcon(
//                                     //             FontAwesomeIcons.circleCheck,
//                                     //             size: 30,
//                                     //             color: AppColors.primary,
//                                     //           ),
//                                     //           SizedBox(
//                                     //             width: 5.0.h,
//                                     //           ),
//                                     //           const FaIcon(
//                                     //             FontAwesomeIcons.circleXmark,
//                                     //             size: 30,
//                                     //             color: AppColors.grey2,
//                                     //           ),
//                                     //         ],
//                                     //       )),
//                                     //   const Divider(),
//                                     //   ListTile(
//                                     //       onTap: () {},
//                                     //       leading: GestureDetector(
//                                     //         onTap: () async {
//                                     //           // Display the image in large form.
//                                     //         },
//                                     //         child: Container(
//                                     //           height: 50.0,
//                                     //           width: 50.0,
//                                     //           decoration: const BoxDecoration(
//                                     //               color: Colors.blue,
//                                     //               borderRadius: BorderRadius.all(
//                                     //                   Radius.circular(50))),
//                                     //           child: const CircleAvatar(
//                                     //               radius: 50,
//                                     //               backgroundImage: NetworkImage(
//                                     //                   "https://t4.ftcdn.net/jpg/02/97/24/51/360_F_297245133_gBPfK0h10UM3y7vfoEiBC3ZXt559KZar.jpg")),
//                                     //         ),
//                                     //       ),
//                                     //       title: const Text(
//                                     //         'Jon Aklas',
//                                     //         style: TextStyle(fontSize: 15),
//                                     //       ),
//                                     //       subtitle: const CustomText.bodySmall(
//                                     //           'SoftWare Test Engineer',
//                                     //           style: TextStyle(
//                                     //             color: AppColors.grey2,
//                                     //           ),
//                                     //           maxLines: 2,
//                                     //           textOverflow: TextOverflow.ellipsis),
//                                     //       trailing: Row(
//                                     //         mainAxisSize: MainAxisSize.min,
//                                     //         children: [
//                                     //           const FaIcon(
//                                     //             FontAwesomeIcons.circleCheck,
//                                     //             size: 30,
//                                     //             color: AppColors.primary,
//                                     //           ),
//                                     //           SizedBox(
//                                     //             width: 5.0.h,
//                                     //           ),
//                                     //           const FaIcon(
//                                     //             FontAwesomeIcons.circleXmark,
//                                     //             size: 30,
//                                     //             color: AppColors.grey2,
//                                     //           ),
//                                     //         ],
//                                     //       )),
//                                     //   const Divider(),
//                                     //   ListTile(
//                                     //       onTap: () {},
//                                     //       leading: GestureDetector(
//                                     //         onTap: () async {
//                                     //           // Display the image in large form.
//                                     //         },
//                                     //         child: Container(
//                                     //           height: 50.0,
//                                     //           width: 50.0,
//                                     //           decoration: const BoxDecoration(
//                                     //               color: Colors.blue,
//                                     //               borderRadius: BorderRadius.all(
//                                     //                   Radius.circular(50))),
//                                     //           child: const CircleAvatar(
//                                     //               radius: 50,
//                                     //               backgroundImage: NetworkImage(
//                                     //                   "https://t4.ftcdn.net/jpg/04/22/82/39/360_F_422823992_ZtyrE96o6wGTJcyZolZ6pLRUGHBRCH9c.jpg")),
//                                     //         ),
//                                     //       ),
//                                     //       title: const Text(
//                                     //         'Yaman Salm',
//                                     //         style: TextStyle(fontSize: 15),
//                                     //       ),
//                                     //       subtitle: const CustomText.bodySmall(
//                                     //           'Technical Recruiter',
//                                     //           style: TextStyle(
//                                     //             color: AppColors.grey2,
//                                     //           ),
//                                     //           maxLines: 2,
//                                     //           textOverflow: TextOverflow.ellipsis),
//                                     //       trailing: Row(
//                                     //         mainAxisSize: MainAxisSize.min,
//                                     //         children: [
//                                     //           const FaIcon(
//                                     //             FontAwesomeIcons.circleCheck,
//                                     //             size: 30,
//                                     //             color: AppColors.primary,
//                                     //           ),
//                                     //           SizedBox(
//                                     //             width: 5.0.h,
//                                     //           ),
//                                     //           const FaIcon(
//                                     //             FontAwesomeIcons.circleXmark,
//                                     //             size: 30,
//                                     //             color: AppColors.grey2,
//                                     //           ),
//                                     //         ],
//                                     //       )),
//                                     //   const Divider(),
//                                     //   ListTile(
//                                     //       onTap: () {},
//                                     //       leading: GestureDetector(
//                                     //         onTap: () async {
//                                     //           // Display the image in large form.
//                                     //         },
//                                     //         child: Container(
//                                     //           height: 50.0,
//                                     //           width: 50.0,
//                                     //           decoration: const BoxDecoration(
//                                     //               color: Colors.blue,
//                                     //               borderRadius: BorderRadius.all(
//                                     //                   Radius.circular(50))),
//                                     //           child: const CircleAvatar(
//                                     //               radius: 50,
//                                     //               backgroundImage: NetworkImage(
//                                     //                   "https://media.istockphoto.com/photos/portrait-of-happy-indian-man-smiling-at-home-picture-id1270067432?k=20&m=1270067432&s=170667a&w=0&h=oteWnPwtJfubzHmfGPfTfvrSSTVsLQ3hMP18oxIJaZk=")),
//                                     //         ),
//                                     //       ),
//                                     //       title: const Text(
//                                     //         'Jad ALAbed',
//                                     //         style: TextStyle(fontSize: 15),
//                                     //       ),
//                                     //       subtitle: const CustomText.bodySmall(
//                                     //           'Senior Machine Learning Engineer',
//                                     //           style: TextStyle(
//                                     //             color: AppColors.grey2,
//                                     //           ),
//                                     //           maxLines: 2,
//                                     //           textOverflow: TextOverflow.ellipsis),
//                                     //       trailing: Row(
//                                     //         mainAxisSize: MainAxisSize.min,
//                                     //         children: [
//                                     //           const FaIcon(
//                                     //             FontAwesomeIcons.circleCheck,
//                                     //             size: 30,
//                                     //             color: AppColors.primary,
//                                     //           ),
//                                     //           SizedBox(
//                                     //             width: 5.0.h,
//                                     //           ),
//                                     //           const FaIcon(
//                                     //             FontAwesomeIcons.circleXmark,
//                                     //             size: 30,
//                                     //             color: AppColors.grey2,
//                                     //           ),
//                                     //         ],
//                                     //       )),
//                                     //   const Divider(),
//                                     // ],