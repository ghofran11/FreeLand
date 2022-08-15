import 'package:flutter/material.dart';
import 'package:freeland/common/widgets/text.dart';

class CurrencySymbol extends StatelessWidget {
 final Color? color;
  const CurrencySymbol({Key? key,this. color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  CustomText.labelMedium('\$',style: TextStyle(color: color),);
  }
}
