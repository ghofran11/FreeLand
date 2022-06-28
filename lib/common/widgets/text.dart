import 'dart:ui' as ui show TextHeightBehavior;

import 'package:flutter/material.dart';

enum CustomTextStyle {
  displayLarge,
  displayMedium,
  displaySmall,
  headlineLarge,
  headlineMedium,
  headlineSmall,
  titleLarge,
  titleMedium,
  titleSmall,
  bodyLarge,
  bodyMedium,
  bodySmall,
  labelLarge,
  labelMedium,
  labelSmall,
}

class CustomText extends Text {
  const CustomText._(
    String text, {
    Key? key,
    required this.textStyle,
    TextStyle? style,
    TextAlign? textAlign,
    bool? softWrap,
    TextOverflow? textOverflow,
    int? maxLines,
    Locale? locale,
    String? semanticsLabel,
    StrutStyle? strutStyle,
    TextDirection? textDirection,
    ui.TextHeightBehavior? textHeightBehavior,
    double? textScaleFactor,
    TextWidthBasis? textWidthBasis,
  }) : super(
          text,
          key: key,
          style: style,
          textAlign: textAlign,
          textWidthBasis: textWidthBasis,
          textScaleFactor: textScaleFactor,
          strutStyle: strutStyle,
          semanticsLabel: semanticsLabel,
          locale: locale,
          maxLines: maxLines,
          softWrap: softWrap,
          textDirection: textDirection,
          textHeightBehavior: textHeightBehavior,
          overflow: textOverflow,
        );

  const CustomText.displayLarge(
    String text, {
    Key? key,
    TextStyle? style,
    TextAlign? textAlign,
    bool? softWrap,
    TextOverflow? textOverflow,
    int? maxLines,
    Locale? locale,
    String? semanticsLabel,
    StrutStyle? strutStyle,
    TextDirection? textDirection,
    ui.TextHeightBehavior? textHeightBehavior,
    double? textScaleFactor,
    TextWidthBasis? textWidthBasis,
  }) : this._(
          text,
          textStyle: CustomTextStyle.displayLarge,
          key: key,
          style: style,
          textAlign: textAlign,
          textWidthBasis: textWidthBasis,
          textScaleFactor: textScaleFactor,
          strutStyle: strutStyle,
          semanticsLabel: semanticsLabel,
          locale: locale,
          maxLines: maxLines,
          softWrap: softWrap,
          textDirection: textDirection,
          textHeightBehavior: textHeightBehavior,
          textOverflow: textOverflow,
        );

  const CustomText.displayMedium(
    String text, {
    Key? key,
    TextStyle? style,
    TextAlign? textAlign,
    bool? softWrap,
    TextOverflow? textOverflow,
    int? maxLines,
    Locale? locale,
    String? semanticsLabel,
    StrutStyle? strutStyle,
    TextDirection? textDirection,
    ui.TextHeightBehavior? textHeightBehavior,
    double? textScaleFactor,
    TextWidthBasis? textWidthBasis,
  }) : this._(
          text,
          textStyle: CustomTextStyle.displayMedium,
          key: key,
          style: style,
          textAlign: textAlign,
          textWidthBasis: textWidthBasis,
          textScaleFactor: textScaleFactor,
          strutStyle: strutStyle,
          semanticsLabel: semanticsLabel,
          locale: locale,
          maxLines: maxLines,
          softWrap: softWrap,
          textDirection: textDirection,
          textHeightBehavior: textHeightBehavior,
          textOverflow: textOverflow,
        );

  const CustomText.displaySmall(
    String text, {
    Key? key,
    TextStyle? style,
    TextAlign? textAlign,
    bool? softWrap,
    TextOverflow? textOverflow,
    int? maxLines,
    Locale? locale,
    String? semanticsLabel,
    StrutStyle? strutStyle,
    TextDirection? textDirection,
    ui.TextHeightBehavior? textHeightBehavior,
    double? textScaleFactor,
    TextWidthBasis? textWidthBasis,
  }) : this._(
          text,
          textStyle: CustomTextStyle.displaySmall,
          key: key,
          style: style,
          textAlign: textAlign,
          textWidthBasis: textWidthBasis,
          textScaleFactor: textScaleFactor,
          strutStyle: strutStyle,
          semanticsLabel: semanticsLabel,
          locale: locale,
          maxLines: maxLines,
          softWrap: softWrap,
          textDirection: textDirection,
          textHeightBehavior: textHeightBehavior,
          textOverflow: textOverflow,
        );

  const CustomText.headlineLarge(
    String text, {
    Key? key,
    TextStyle? style,
    TextAlign? textAlign,
    bool? softWrap,
    TextOverflow? textOverflow,
    int? maxLines,
    Locale? locale,
    String? semanticsLabel,
    StrutStyle? strutStyle,
    TextDirection? textDirection,
    ui.TextHeightBehavior? textHeightBehavior,
    double? textScaleFactor,
    TextWidthBasis? textWidthBasis,
  }) : this._(
          text,
          textStyle: CustomTextStyle.headlineLarge,
          key: key,
          style: style,
          textAlign: textAlign,
          textWidthBasis: textWidthBasis,
          textScaleFactor: textScaleFactor,
          strutStyle: strutStyle,
          semanticsLabel: semanticsLabel,
          locale: locale,
          maxLines: maxLines,
          softWrap: softWrap,
          textDirection: textDirection,
          textHeightBehavior: textHeightBehavior,
          textOverflow: textOverflow,
        );

  const CustomText.headlineMedium(
    String text, {
    Key? key,
    TextStyle? style,
    TextAlign? textAlign,
    bool? softWrap,
    TextOverflow? textOverflow,
    int? maxLines,
    Locale? locale,
    String? semanticsLabel,
    StrutStyle? strutStyle,
    TextDirection? textDirection,
    ui.TextHeightBehavior? textHeightBehavior,
    double? textScaleFactor,
    TextWidthBasis? textWidthBasis,
  }) : this._(
          text,
          textStyle: CustomTextStyle.headlineMedium,
          key: key,
          style: style,
          textAlign: textAlign,
          textWidthBasis: textWidthBasis,
          textScaleFactor: textScaleFactor,
          strutStyle: strutStyle,
          semanticsLabel: semanticsLabel,
          locale: locale,
          maxLines: maxLines,
          softWrap: softWrap,
          textDirection: textDirection,
          textHeightBehavior: textHeightBehavior,
          textOverflow: textOverflow,
        );

  const CustomText.headlineSmall(
    String text, {
    Key? key,
    TextStyle? style,
    TextAlign? textAlign,
    bool? softWrap,
    TextOverflow? textOverflow,
    int? maxLines,
    Locale? locale,
    String? semanticsLabel,
    StrutStyle? strutStyle,
    TextDirection? textDirection,
    ui.TextHeightBehavior? textHeightBehavior,
    double? textScaleFactor,
    TextWidthBasis? textWidthBasis,
  }) : this._(
          text,
          textStyle: CustomTextStyle.headlineSmall,
          key: key,
          style: style,
          textAlign: textAlign,
          textWidthBasis: textWidthBasis,
          textScaleFactor: textScaleFactor,
          strutStyle: strutStyle,
          semanticsLabel: semanticsLabel,
          locale: locale,
          maxLines: maxLines,
          softWrap: softWrap,
          textDirection: textDirection,
          textHeightBehavior: textHeightBehavior,
          textOverflow: textOverflow,
        );

  const CustomText.titleLarge(
    String text, {
    Key? key,
    TextStyle? style,
    TextAlign? textAlign,
    bool? softWrap,
    TextOverflow? textOverflow,
    int? maxLines,
    Locale? locale,
    String? semanticsLabel,
    StrutStyle? strutStyle,
    TextDirection? textDirection,
    ui.TextHeightBehavior? textHeightBehavior,
    double? textScaleFactor,
    TextWidthBasis? textWidthBasis,
  }) : this._(
          text,
          textStyle: CustomTextStyle.titleLarge,
          key: key,
          style: style,
          textAlign: textAlign,
          textWidthBasis: textWidthBasis,
          textScaleFactor: textScaleFactor,
          strutStyle: strutStyle,
          semanticsLabel: semanticsLabel,
          locale: locale,
          maxLines: maxLines,
          softWrap: softWrap,
          textDirection: textDirection,
          textHeightBehavior: textHeightBehavior,
          textOverflow: textOverflow,
        );

  const CustomText.titleMedium(
    String text, {
    Key? key,
    TextStyle? style,
    TextAlign? textAlign,
    bool? softWrap,
    TextOverflow? textOverflow,
    int? maxLines,
    Locale? locale,
    String? semanticsLabel,
    StrutStyle? strutStyle,
    TextDirection? textDirection,
    ui.TextHeightBehavior? textHeightBehavior,
    double? textScaleFactor,
    TextWidthBasis? textWidthBasis,
  }) : this._(
          text,
          textStyle: CustomTextStyle.titleMedium,
          key: key,
          style: style,
          textAlign: textAlign,
          textWidthBasis: textWidthBasis,
          textScaleFactor: textScaleFactor,
          strutStyle: strutStyle,
          semanticsLabel: semanticsLabel,
          locale: locale,
          maxLines: maxLines,
          softWrap: softWrap,
          textDirection: textDirection,
          textHeightBehavior: textHeightBehavior,
          textOverflow: textOverflow,
        );

  const CustomText.titleSmall(
    String text, {
    Key? key,
    TextStyle? style,
    TextAlign? textAlign,
    bool? softWrap,
    TextOverflow? textOverflow,
    int? maxLines,
    Locale? locale,
    String? semanticsLabel,
    StrutStyle? strutStyle,
    TextDirection? textDirection,
    ui.TextHeightBehavior? textHeightBehavior,
    double? textScaleFactor,
    TextWidthBasis? textWidthBasis,
  }) : this._(
          text,
          textStyle: CustomTextStyle.titleSmall,
          key: key,
          style: style,
          textAlign: textAlign,
          textWidthBasis: textWidthBasis,
          textScaleFactor: textScaleFactor,
          strutStyle: strutStyle,
          semanticsLabel: semanticsLabel,
          locale: locale,
          maxLines: maxLines,
          softWrap: softWrap,
          textDirection: textDirection,
          textHeightBehavior: textHeightBehavior,
          textOverflow: textOverflow,
        );

  const CustomText.bodyLarge(
    String text, {
    Key? key,
    TextStyle? style,
    TextAlign? textAlign,
    bool? softWrap,
    TextOverflow? textOverflow,
    int? maxLines,
    Locale? locale,
    String? semanticsLabel,
    StrutStyle? strutStyle,
    TextDirection? textDirection,
    ui.TextHeightBehavior? textHeightBehavior,
    double? textScaleFactor,
    TextWidthBasis? textWidthBasis,
  }) : this._(
          text,
          textStyle: CustomTextStyle.bodyLarge,
          key: key,
          style: style,
          textAlign: textAlign,
          textWidthBasis: textWidthBasis,
          textScaleFactor: textScaleFactor,
          strutStyle: strutStyle,
          semanticsLabel: semanticsLabel,
          locale: locale,
          maxLines: maxLines,
          softWrap: softWrap,
          textDirection: textDirection,
          textHeightBehavior: textHeightBehavior,
          textOverflow: textOverflow,
        );

  const CustomText.bodyMedium(
    String text, {
    Key? key,
    TextStyle? style,
    TextAlign? textAlign,
    bool? softWrap,
    TextOverflow? textOverflow,
    int? maxLines,
    Locale? locale,
    String? semanticsLabel,
    StrutStyle? strutStyle,
    TextDirection? textDirection,
    ui.TextHeightBehavior? textHeightBehavior,
    double? textScaleFactor,
    TextWidthBasis? textWidthBasis,
  }) : this._(
          text,
          textStyle: CustomTextStyle.bodyMedium,
          key: key,
          style: style,
          textAlign: textAlign,
          textWidthBasis: textWidthBasis,
          textScaleFactor: textScaleFactor,
          strutStyle: strutStyle,
          semanticsLabel: semanticsLabel,
          locale: locale,
          maxLines: maxLines,
          softWrap: softWrap,
          textDirection: textDirection,
          textHeightBehavior: textHeightBehavior,
          textOverflow: textOverflow,
        );

  const CustomText.bodySmall(
    String text, {
    Key? key,
    TextStyle? style,
    TextAlign? textAlign,
    bool? softWrap,
    TextOverflow? textOverflow,
    int? maxLines,
    Locale? locale,
    String? semanticsLabel,
    StrutStyle? strutStyle,
    TextDirection? textDirection,
    ui.TextHeightBehavior? textHeightBehavior,
    double? textScaleFactor,
    TextWidthBasis? textWidthBasis,
  }) : this._(
          text,
          textStyle: CustomTextStyle.bodySmall,
          key: key,
          style: style,
          textAlign: textAlign,
          textWidthBasis: textWidthBasis,
          textScaleFactor: textScaleFactor,
          strutStyle: strutStyle,
          semanticsLabel: semanticsLabel,
          locale: locale,
          maxLines: maxLines,
          softWrap: softWrap,
          textDirection: textDirection,
          textHeightBehavior: textHeightBehavior,
          textOverflow: textOverflow,
        );

  const CustomText.labelLarge(
    String text, {
    Key? key,
    TextStyle? style,
    TextAlign? textAlign,
    bool? softWrap,
    TextOverflow? textOverflow,
    int? maxLines,
    Locale? locale,
    String? semanticsLabel,
    StrutStyle? strutStyle,
    TextDirection? textDirection,
    ui.TextHeightBehavior? textHeightBehavior,
    double? textScaleFactor,
    TextWidthBasis? textWidthBasis,
  }) : this._(
          text,
          textStyle: CustomTextStyle.labelLarge,
          key: key,
          style: style,
          textAlign: textAlign,
          textWidthBasis: textWidthBasis,
          textScaleFactor: textScaleFactor,
          strutStyle: strutStyle,
          semanticsLabel: semanticsLabel,
          locale: locale,
          maxLines: maxLines,
          softWrap: softWrap,
          textDirection: textDirection,
          textHeightBehavior: textHeightBehavior,
          textOverflow: textOverflow,
        );

  const CustomText.labelMedium(
    String text, {
    Key? key,
    TextStyle? style,
    TextAlign? textAlign,
    bool? softWrap,
    TextOverflow? textOverflow,
    int? maxLines,
    Locale? locale,
    String? semanticsLabel,
    StrutStyle? strutStyle,
    TextDirection? textDirection,
    ui.TextHeightBehavior? textHeightBehavior,
    double? textScaleFactor,
    TextWidthBasis? textWidthBasis,
  }) : this._(
          text,
          textStyle: CustomTextStyle.labelMedium,
          key: key,
          style: style,
          textAlign: textAlign,
          textWidthBasis: textWidthBasis,
          textScaleFactor: textScaleFactor,
          strutStyle: strutStyle,
          semanticsLabel: semanticsLabel,
          locale: locale,
          maxLines: maxLines,
          softWrap: softWrap,
          textDirection: textDirection,
          textHeightBehavior: textHeightBehavior,
          textOverflow: textOverflow,
        );

  const CustomText.labelSmall(
    String text, {
    Key? key,
    TextStyle? style,
    TextAlign? textAlign,
    bool? softWrap,
    TextOverflow? textOverflow,
    int? maxLines,
    Locale? locale,
    String? semanticsLabel,
    StrutStyle? strutStyle,
    TextDirection? textDirection,
    ui.TextHeightBehavior? textHeightBehavior,
    double? textScaleFactor,
    TextWidthBasis? textWidthBasis,
  }) : this._(
          text,
          textStyle: CustomTextStyle.labelSmall,
          key: key,
          style: style,
          textAlign: textAlign,
          textWidthBasis: textWidthBasis,
          textScaleFactor: textScaleFactor,
          strutStyle: strutStyle,
          semanticsLabel: semanticsLabel,
          locale: locale,
          maxLines: maxLines,
          softWrap: softWrap,
          textDirection: textDirection,
          textHeightBehavior: textHeightBehavior,
          textOverflow: textOverflow,
        );

  final CustomTextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    TextStyle? style;
    switch (textStyle) {
      case CustomTextStyle.displayLarge:
        style = textTheme.displayLarge;
        break;
      case CustomTextStyle.displayMedium:
        style = textTheme.displayMedium;
        break;
      case CustomTextStyle.displaySmall:
        style = textTheme.displaySmall;
        break;
      case CustomTextStyle.headlineLarge:
        style = textTheme.headlineLarge;
        break;
      case CustomTextStyle.headlineMedium:
        style = textTheme.headlineMedium;
        break;
      case CustomTextStyle.headlineSmall:
        style = textTheme.headlineSmall;
        break;
      case CustomTextStyle.titleLarge:
        style = textTheme.titleLarge;
        break;
      case CustomTextStyle.titleMedium:
        style = textTheme.titleMedium;
        break;
      case CustomTextStyle.titleSmall:
        style = textTheme.titleSmall;
        break;
      case CustomTextStyle.bodyLarge:
        style = textTheme.bodyLarge;
        break;
      case CustomTextStyle.bodyMedium:
        style = textTheme.bodyMedium;
        break;
      case CustomTextStyle.bodySmall:
        style = textTheme.bodySmall;
        break;
      case CustomTextStyle.labelLarge:
        style = textTheme.labelLarge;
        break;
      case CustomTextStyle.labelMedium:
        style = textTheme.labelMedium;
        break;
      case CustomTextStyle.labelSmall:
        style = textTheme.labelSmall;
        break;
    }
    return DefaultTextStyle.merge(
      style: style ?? TextStyle(),
      child: Builder(builder: (context) => super.build(context)),
    );
  }
}
