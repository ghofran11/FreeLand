import 'package:flutter/cupertino.dart';
import 'package:freeland/common/config/theme/src/colors.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({Key? key, this.color = AppColors.blue8, this.dim = 30})
      : super(key: key);
  final double dim;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        height: dim,
        width: dim,
        // child: SvgPicture.asset(Assets.imagesProfile),
      ),
    );
  }
}
