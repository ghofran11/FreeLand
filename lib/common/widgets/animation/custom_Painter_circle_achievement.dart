import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPainterCircleAchievement extends StatefulWidget {
  final bool? isSelected;
  final double? newPercentage;
  final double radius;
  final Widget child;
  final Color? lineColor;
  final Color? completeColor;
  final double? stroke;
  const CustomPainterCircleAchievement(
      {Key? key,
      required this.child,
      this.lineColor,
      this.stroke,
      this.completeColor,
      required this.newPercentage,
      this.isSelected,
      this.radius = 60})
      : assert(isSelected != null || newPercentage != null),
        super(key: key);

  @override
  State<CustomPainterCircleAchievement> createState() =>
      _CustomPainterCircleAchievementState();
}

class _CustomPainterCircleAchievementState
    extends State<CustomPainterCircleAchievement>
    with TickerProviderStateMixin {
  late AnimationController _percentageAnimationController;
  late AnimationController _controller;

  @override
  void initState() {
    _percentageAnimationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 800),
        lowerBound: 0,
        upperBound: widget.newPercentage ?? 100)
      ..addListener(() {
        setState(() {});
      });
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800))
      ..addListener(() {
        setState(() {});
      });

    _controller.forward(from: 0.0);
    _percentageAnimationController.forward(from: 0.0);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      foregroundPainter: MyPainter(
        radius: widget.radius.r,
        lineColor: widget.lineColor ?? const Color(0xff007FFF).withOpacity(0.1),
        completeColor: widget.completeColor ?? const Color(0xff007FFF),
        completePercent: widget.isSelected != null
            ? (widget.isSelected! ? 100.0 : 0.0)
            : _percentageAnimationController.value,
        width: widget.stroke?.r ?? 8.0.r,
      ),
      child: widget.child,
    );
  }
}

class MyPainter extends CustomPainter {
  final Color lineColor;
  final Color completeColor;
  final double completePercent;
  final double width;
  final double radius;

  MyPainter(
      {required this.lineColor,
      required this.completeColor,
      required this.completePercent,
      required this.radius,
      required this.width});

  @override
  void paint(Canvas canvas, Size size) {
    Paint line = Paint()
      ..color = lineColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;
    Paint complete = Paint()
      ..color = completeColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;
    Offset center = Offset(size.width / 2, size.height / 2);
    // double radius = min(size.width / 2, size.height / 2);

    canvas.drawCircle(center, radius, line);
    double arcAngle = 2 * pi * (completePercent / 100);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        arcAngle, false, complete);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
