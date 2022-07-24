import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';

///constant
const double horizontalAppPadding = 18;
const double verticalAppPadding = 18;

const kIconSize = 24.0;
const buttonBorderRadius = 24.0;
const String fontFamily = "Almarai";
const designSize = Size(360, 690);

///Style
EdgeInsets buttonRPadding =
    EdgeInsets.symmetric(horizontal: 12.r, vertical: 12.r);

BorderRadius borderRadiusCircular = BorderRadius.circular(buttonBorderRadius.r);

final ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
  primary: AppColors.primary,
  elevation: 1,
  padding: buttonRPadding.r,
  shape: RoundedRectangleBorder(borderRadius: borderRadiusCircular.r),
);

final ButtonStyle textButtonStyle = TextButton.styleFrom(
    primary: AppColors.grey,
    padding: buttonRPadding.r,
    textStyle: const TextStyle(color: AppColors.grey),
    shape: RoundedRectangleBorder(
      borderRadius: borderRadiusCircular,
    ));
final InputDecorationTheme inputDecorationThemeLight = InputDecorationTheme(
  fillColor: Colors.white,
  focusedBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: AppColors.primary),
    borderRadius: borderRadiusCircular,
  ),
  errorStyle: TextStyle(color: Colors.red, height: 1.sp),
  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
  border: OutlineInputBorder(borderRadius: borderRadiusCircular),
);
final InputDecorationTheme inputDecorationThemeDark = InputDecorationTheme(
  fillColor: Colors.grey[700],
  focusedBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: AppColors.primary),
    borderRadius: borderRadiusCircular,
  ),
  errorStyle: TextStyle(color: Colors.red, height: 1.sp),
  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
  border: OutlineInputBorder(borderRadius: borderRadiusCircular),
);

final ButtonStyle outlineButtonStyle = OutlinedButton.styleFrom(
  primary: AppColors.primary,
  padding: buttonRPadding.r,
  textStyle: const TextStyle(
    fontFamily: fontFamily,
    color: AppColors.primary,
  ),
  side: const BorderSide(color: AppColors.primary),
  shape: RoundedRectangleBorder(borderRadius: borderRadiusCircular.r),
);

final dialogTheme = DialogTheme(
  shape: RoundedRectangleBorder(
    borderRadius: borderRadiusCircular,
  ),
);

final cardTheme = CardTheme(
    margin: EdgeInsets.zero,
    elevation: 2,
    shape: RoundedRectangleBorder(
      borderRadius:BorderRadius.circular(15.0.r) ,
    )
    );

final iconTheme = IconThemeData(size: kIconSize.r, color: Colors.redAccent);

InputDecoration dynamicInputDecorationTheme({
  required ThemeData themeData,
  required String labelText,
  required IconData icon,
  String? hintText,
}) =>
    InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: Icon(icon),
        errorStyle:
            themeData.textTheme.caption!.copyWith(color: themeData.errorColor),
        contentPadding: EdgeInsets.symmetric(horizontal: 10.r),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: borderRadiusCircular),
        errorBorder: InputBorder.none,
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: borderRadiusCircular),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: borderRadiusCircular),
        border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: borderRadiusCircular),
        prefixIconConstraints: BoxConstraints(minWidth: 40.w));

class MyInputBorder extends OutlineInputBorder {
  final Color fillColor;

  const MyInputBorder({
    required this.fillColor,
    BorderSide borderSide = const BorderSide(),
    BorderRadius borderRadius = const BorderRadius.all(Radius.circular(4.0)),
    double gapPadding = 4.0,
  }) : super(
          borderSide: borderSide,
          borderRadius: borderRadius,
          gapPadding: gapPadding,
        );

  @override
  void paint(Canvas canvas, Rect rect,
      {double? gapStart,
      double gapExtent = 0.0,
      double gapPercentage = 0.0,
      TextDirection? textDirection}) {
    super.paint(canvas, rect);
    assert(gapPercentage >= 0.0 && gapPercentage <= 1.0);
    assert(_cornersAreCircular(borderRadius));

    final Paint paint = borderSide.toPaint()
      ..color = fillColor
      ..style = PaintingStyle.fill;
    final RRect outer = borderRadius.toRRect(rect);
    final RRect center = outer.deflate(borderSide.width / 2.0);
    if (gapStart == null || gapExtent <= 0.0 || gapPercentage == 0.0) {
      Path path = Path();
      path.addRRect(center);
      canvas.drawShadow(
          path.shift(const Offset(0.5, 0.5)), Colors.black26, 2, true);
      canvas.drawShadow(
          path.shift(const Offset(-0.5, -0.5)), Colors.black26, 2, true);
      canvas.drawRRect(center, paint);
    } else {
      final double extent =
          lerpDouble(0.0, gapExtent + gapPadding * 2.0, gapPercentage)!;
      switch (textDirection!) {
        case TextDirection.rtl:
          final Path path = _gapBorderPath(canvas, center,
              math.max(0.0, gapStart + gapPadding - extent), extent);
          canvas.drawPath(path, paint);
          break;

        case TextDirection.ltr:
          final Path path = _gapBorderPath(
              canvas, center, math.max(0.0, gapStart - gapPadding), extent);
          canvas.drawPath(path, paint);
          break;
      }
    }
  }

  static bool _cornersAreCircular(BorderRadius borderRadius) {
    return borderRadius.topLeft.x == borderRadius.topLeft.y &&
        borderRadius.bottomLeft.x == borderRadius.bottomLeft.y &&
        borderRadius.topRight.x == borderRadius.topRight.y &&
        borderRadius.bottomRight.x == borderRadius.bottomRight.y;
  }

  Path _gapBorderPath(
      Canvas canvas, RRect center, double start, double extent) {
    // When the corner radii on any side add up to be greater than the
    // given height, each radius has to be scaled to not exceed the
    // size of the width/height of the RRect.
    final RRect scaledRRect = center.scaleRadii();

    final Rect tlCorner = Rect.fromLTWH(
      scaledRRect.left,
      scaledRRect.top,
      scaledRRect.tlRadiusX * 2.0,
      scaledRRect.tlRadiusY * 2.0,
    );
    final Rect trCorner = Rect.fromLTWH(
      scaledRRect.right - scaledRRect.trRadiusX * 2.0,
      scaledRRect.top,
      scaledRRect.trRadiusX * 2.0,
      scaledRRect.trRadiusY * 2.0,
    );
    final Rect brCorner = Rect.fromLTWH(
      scaledRRect.right - scaledRRect.brRadiusX * 2.0,
      scaledRRect.bottom - scaledRRect.brRadiusY * 2.0,
      scaledRRect.brRadiusX * 2.0,
      scaledRRect.brRadiusY * 2.0,
    );
    final Rect blCorner = Rect.fromLTWH(
      scaledRRect.left,
      scaledRRect.bottom - scaledRRect.blRadiusY * 2.0,
      scaledRRect.blRadiusX * 2.0,
      scaledRRect.blRadiusX * 2.0,
    );

    // This assumes that the radius is circular (x and y radius are equal).
    // Currently, BorderRadius only supports circular radii.
    const double cornerArcSweep = math.pi / 2.0;
    final double tlCornerArcSweep = math.acos(
      (1 - start / scaledRRect.tlRadiusX).clamp(0.0, 1.0),
    );

    final Path path = Path()..addArc(tlCorner, math.pi, tlCornerArcSweep);

    if (start > scaledRRect.tlRadiusX)
      path.lineTo(scaledRRect.left + start, scaledRRect.top);

    const double trCornerArcStart = (3 * math.pi) / 2.0;
    const double trCornerArcSweep = cornerArcSweep;
    if (start + extent < scaledRRect.width - scaledRRect.trRadiusX) {
      path.moveTo(scaledRRect.left + start + extent, scaledRRect.top);
      path.lineTo(scaledRRect.right - scaledRRect.trRadiusX, scaledRRect.top);
      path.addArc(trCorner, trCornerArcStart, trCornerArcSweep);
    } else if (start + extent < scaledRRect.width) {
      final double dx = scaledRRect.width - (start + extent);
      final double sweep = math.asin(
        (1 - dx / scaledRRect.trRadiusX).clamp(0.0, 1.0),
      );
      path.addArc(trCorner, trCornerArcStart + sweep, trCornerArcSweep - sweep);
    }

    return path
      ..moveTo(scaledRRect.right, scaledRRect.top + scaledRRect.trRadiusY)
      ..lineTo(scaledRRect.right, scaledRRect.bottom - scaledRRect.brRadiusY)
      ..addArc(brCorner, 0.0, cornerArcSweep)
      ..lineTo(scaledRRect.left + scaledRRect.blRadiusX, scaledRRect.bottom)
      ..addArc(blCorner, math.pi / 2.0, cornerArcSweep)
      ..lineTo(scaledRRect.left, scaledRRect.top + scaledRRect.tlRadiusY);
  }
}
