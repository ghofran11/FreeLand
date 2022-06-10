import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'back_button.dart';

class SliverAppAppbar extends StatelessWidget {
  const SliverAppAppbar(
      {Key? key, required this.title, required this.actionAsset})
      : super(key: key);
  final String title;

  ///svg
  final String actionAsset;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      centerTitle: true,
      title: Text(title),
      leading: const AppBackButton(),
      actions: [
        SvgPicture.asset(
          actionAsset,
        )
      ],
    );
  }
}
