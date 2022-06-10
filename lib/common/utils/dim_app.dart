import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DimApp {
  static double getHeightWithoutAppBarAndStatusBAr(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double statusBar = MediaQuery.of(context).viewPadding.top;
    double _kLeadingWidth = kToolbarHeight;
    return size.height - statusBar - _kLeadingWidth;
  }
}
