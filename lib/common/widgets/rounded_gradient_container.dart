import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class RoundedGradientContainer extends StatelessWidget {
  const RoundedGradientContainer({
    Key? key,
    required this.colorsGradient,
    this.boxShadows,
    this.asset,
    this.child,
    this.dim,
    this.width,
    this.height,
    this.colorAsset,
    this.padding,
    this.radius = 10,
  })  : assert(child != null || asset != null),
        super(key: key);

  final List<Color> colorsGradient;
  final List<BoxShadow>? boxShadows;
  final String? asset;
  final Widget? child;
  final Color? colorAsset;
  final double? dim;
  final double? height;
  final double radius;
  final double? width;
  final EdgeInsets? padding;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height?.h,
      width: width?.w,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: colorsGradient,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(radius),
          boxShadow: boxShadows),
      child: child ??
          Center(
            child: Padding(
              padding: padding ?? EdgeInsets.zero,
              child: SvgPicture.asset(
                asset!,
                color: colorAsset,
                width: dim,
                height: dim,
              ),
            ),
          ),
    );
  }
}
