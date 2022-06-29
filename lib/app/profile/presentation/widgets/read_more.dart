import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class AppReadMore extends StatelessWidget {
  final String text;
  final int trimLines;

  const AppReadMore({Key? key, required this.text, this.trimLines = 3})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    return ReadMoreText(
      text,
      trimLines: trimLines,
      trimMode: TrimMode.Line,
      trimCollapsedText: 'more',
      trimExpandedText: 'less',
      moreStyle: themeData.textTheme.bodyMedium
          ?.copyWith(color: themeData.disabledColor),
      lessStyle: themeData.textTheme.bodyMedium
          ?.copyWith(color: themeData.disabledColor),
    );
  }
}
