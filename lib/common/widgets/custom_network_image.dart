import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

import 'full_screen_page.dart';

class CustomNetworkImage extends StatelessWidget {
  CustomNetworkImage({
    Key? key,
    required this.url,
    this.height,
    this.width,
    this.borderRadius,
    this.viewFullImageWhenClick = false,
    this.border,
    this.fit = BoxFit.cover,
  }) : super(key: key);
  final String url;
  final double? height;
  final double? width;
  final BorderRadius? borderRadius;
  final BoxBorder? border;
  final BoxFit? fit;
  final bool viewFullImageWhenClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: viewFullImageWhenClick
          ? () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  opaque: false,
                  // barrierColor: dark ? Colors.black : Colors.white,
                  pageBuilder: (BuildContext context, _, __) {
                    return FullScreenPage(
                      dark: true,
                      url: url,
                    );
                  },
                ),
              );
            }
          : null,
      child: ExtendedImage.network(
        url,
        height: height,
        width: width,
        borderRadius: borderRadius,
        fit: fit,
        border: border,
      ),
    );
  }
}
