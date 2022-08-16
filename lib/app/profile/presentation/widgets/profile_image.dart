import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freeland/common/config/theme/src/colors.dart';

class ProfileImage extends StatelessWidget {
  final double radius;
  final String image;

  const ProfileImage({
    Key? key,
    this.radius = 50,
    this.image =
        'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlciUyMHByb2ZpbGV8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        radius: radius.r,
        backgroundColor: AppColors.darkBlue,
        child: CircleAvatar(
          radius: (radius - 2).r,
          backgroundImage: CachedNetworkImageProvider(image),
        ));
  }
}
