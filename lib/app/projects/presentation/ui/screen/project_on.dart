import 'package:flutter/material.dart';
import 'package:freeland/app/projects/presentation/ui/screen/working_on.dart';
import 'package:go_router/go_router.dart';

import 'chat.dart';

class ProjectOn extends StatelessWidget {
  const ProjectOn({Key? key}) : super(key: key);

  static Page pageBuilder(BuildContext context, GoRouterState state) {
    return MaterialPage<void>(
      key: state.pageKey,
      child: ProjectOn(),
    );
  }

  static const routePath = 'projectOn_screen';
  static const routeName = 'projectOn_screen';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title:const Text('Flower Lab'),
            bottom: const TabBar(
              tabs: [
                Tab( text: "Progress"),
                Tab( text: "Chat")
              ],
            ),
          ),
          body:  TabBarView(
            children: [WorkingOn(), Chat()],
          ),
        ),
      ),
    );
  }
}
