import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freeland/common/config/theme/src/colors.dart';

class EditButton extends StatelessWidget {
  final VoidCallback onPressed;
  const EditButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        padding: EdgeInsets.all(2.0),
        constraints: BoxConstraints(),
        onPressed: onPressed,
        icon: FaIcon(FontAwesomeIcons.pencil,
            size: 16.0.r, color: AppColors.grey2));
  }
}
