import 'package:flutter/material.dart';

class ChipApp extends StatelessWidget {
  const ChipApp(
      {Key? key,
      required this.child,
      this.color = const Color(0xffFF5B5B),
      this.height = 20,
      this.radius = 7,
      this.border,
      this.onTap,
      this.width})
      : super(key: key);
  final Widget child;
  final Color? color;
  final double height;
  final double? width;
  final double radius;
  final Border? border;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              border: border,
              color: color,
              borderRadius: BorderRadius.circular(radius)),
          child: FittedBox(child: child)),
    );
  }
}
