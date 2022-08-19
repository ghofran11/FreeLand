import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freeland/app/profile/infrastructur/models/my_profile.dart';
import 'package:freeland/common/config/theme/src/colors.dart';
import 'package:freeland/common/widgets/text.dart';
import 'package:freeland/core/user/provider/user_provider.dart';
import 'package:go_router/go_router.dart';
class ConnectionScreen extends StatelessWidget {
 final List<ConnectedUsers> connectedUsers;
  const ConnectionScreen({Key? key,required this.connectedUsers}) : super(key: key);

  static Page pageBuilder(BuildContext context, GoRouterState state) {
    return MaterialPage<void>(
      key: state.pageKey,
      child:  ConnectionScreen(
        connectedUsers: state.extra as List<ConnectedUsers>,
      ),
    );
  }
  static const routePath = 'connection_screen';
  static const routeName = 'connection_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
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
                    'Connections',
                    style: TextStyle(),
                  ),
                ],
              ),

              ListView.separated(
                shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return  ListTile(
                        onTap: () {
                              context.read<UserProvider>().user!.id;
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
                            child:  CircleAvatar(
                                radius: 50,
                                backgroundImage: NetworkImage(
                                    connectedUsers[index].imagePath
                                    )),
                          ),
                        ),
                        title:  Text(
                          connectedUsers[index].name,
                          style:const TextStyle(fontSize: 15),
                        ),
                       );
                  },
                  separatorBuilder: (context,index){
                    return const Divider();
                  },
                  itemCount: connectedUsers.length)
            ],
          ),
        ),
      ),
    );
  }
}
