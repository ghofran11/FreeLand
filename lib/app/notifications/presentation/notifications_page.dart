import 'package:flutter/material.dart';
import 'package:freeland/common/widgets/text.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CustomText.titleLarge("Notifications Coming Soon"),
      ),
    );
  }
}
