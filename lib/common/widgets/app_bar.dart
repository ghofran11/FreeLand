import 'package:flutter/material.dart';

class SliverAppBar extends StatelessWidget {
  const SliverAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(
          100,
          (100 * 1.5314009661835748)
              .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
      painter: RPSCustomPainter(),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(0, size.height * 0.1359189);
    path_0.cubicTo(
        0,
        size.height * 0.1074882,
        size.width * 0.02912053,
        size.height * 0.08256940,
        size.width * 0.07111522,
        size.height * 0.07506498);
    path_0.lineTo(size.width * 0.4744976, size.height * 0.002980158);
    path_0.cubicTo(
        size.width * 0.4911908,
        size.height * -0.000003286435,
        size.width * 0.5088068,
        size.height * -0.000003289826,
        size.width * 0.5255024,
        size.height * 0.002980158);
    path_0.lineTo(size.width * 0.9288841, size.height * 0.07506498);
    path_0.cubicTo(size.width * 0.9708792, size.height * 0.08256940, size.width,
        size.height * 0.1074880, size.width, size.height * 0.1359188);
    path_0.lineTo(size.width, size.height * 0.9858044);
    path_0.cubicTo(size.width, size.height * 1.020648, size.width * 0.9567415,
        size.height * 1.048896, size.width * 0.9033816, size.height * 1.048896);
    path_0.lineTo(size.width * 0.09661836, size.height * 1.048896);
    path_0.cubicTo(size.width * 0.04325749, size.height * 1.048896, 0,
        size.height * 1.020648, 0, size.height * 0.9858044);
    path_0.lineTo(0, size.height * 0.1359189);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xffAA78FF).withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
