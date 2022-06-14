import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';
import 'styles.dart';

class AppThemes {
  AppThemes._internal();

  static final ThemeData lightThemeData = ThemeData(
      tabBarTheme: TabBarTheme(
          labelColor: AppColors.primary,
          unselectedLabelColor: AppColors.primary.withOpacity(0.4)),
      textTheme: textTheme,
      brightness: Brightness.light,
      fontFamily: fontFamily,
      primaryColor: AppColors.primary,
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: AppColors.primary,
      ),
      scaffoldBackgroundColor: AppColors.background,
      outlinedButtonTheme: OutlinedButtonThemeData(style: outlineButtonStyle),
      elevatedButtonTheme: ElevatedButtonThemeData(style: elevatedButtonStyle),
      appBarTheme: const AppBarTheme(
          elevation: 0,
          foregroundColor: AppColors.black,
          //     titleTextStyle: TextStyle(color: AppColors.black),
          systemOverlayStyle: SystemUiOverlayStyle.light,
          iconTheme: IconThemeData(color: AppColors.black),
          color: Colors.transparent),
      cardTheme: cardTheme,
      dialogTheme: dialogTheme,
      textButtonTheme: TextButtonThemeData(
        style: textButtonStyle,
      ),
      iconTheme: iconTheme,
      chipTheme: const ChipThemeData(
        selectedColor: AppColors.primary,
      ),
      // primarySwatch: AppColors.accent as MaterialColor,
      colorScheme: ThemeData.light().colorScheme.copyWith(
          primary: AppColors.primary,
          secondary: AppColors.accent,
          primaryContainer: AppColors.white,
          onSecondary: AppColors.primary),
      inputDecorationTheme: inputDecorationThemeLight);

  static final ThemeData darkThemeData = ThemeData(
      brightness: Brightness.dark,
      primaryColor: AppColors.primary,
      fontFamily: fontFamily,
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: AppColors.primary,
      ),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        //     titleTextStyle: TextStyle(color: AppColors.white),
        iconTheme: IconThemeData(color: AppColors.white),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      cardTheme: cardTheme,
      dialogTheme: dialogTheme,
      outlinedButtonTheme: OutlinedButtonThemeData(style: outlineButtonStyle),
      elevatedButtonTheme: ElevatedButtonThemeData(style: elevatedButtonStyle),
      textButtonTheme: TextButtonThemeData(style: textButtonStyle),
      iconTheme: IconThemeData(
        size: kIconSize.r,
        color: Colors.white,
      ),
      textTheme: textTheme,

      // primarySwatch: AppColors.accent as MaterialColor,
      colorScheme: ThemeData.dark().colorScheme.copyWith(
          primary: AppColors.primary,
          secondary: AppColors.accent,
          primaryContainer: Colors.grey[700]),
      inputDecorationTheme: inputDecorationThemeDark);

  static TextTheme textTheme = TextTheme(

      // headline1: TextStyle(fontSize: 97.sp),
      // headline2: TextStyle(fontSize: 61.sp),
      // headline3: TextStyle(fontSize: 49.sp),
      // headline4: TextStyle(fontSize: 34.sp),
      // headline5: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w600),
      // headline6: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
      // bodyText1: TextStyle(fontSize: 14.sp),
      // bodyText2: TextStyle(fontSize: 13.sp),
      // subtitle1: TextStyle(fontSize: 14.sp),
      // subtitle2: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
      // caption: TextStyle(fontSize: 12.sp),
      // button: TextStyle(fontSize: 13.sp),
      // overline: TextStyle(fontSize: 10.sp),
      );
}
// NAME         SIZE  WEIGHT  SPACING
// headline1    96.0  light   -1.5
// headline2    60.0  light   -0.5
// headline3    48.0  regular  0.0
// headline4    34.0  regular  0.25
// headline5    24.0  regular  0.0
// headline6    20.0  medium   0.15
// subtitle1    16.0  regular  0.15
// subtitle2    14.0  medium   0.1
// body1        16.0  regular  0.5   (bodyText1)
// body2        14.0  regular  0.25  (bodyText2)
// button       14.0  medium   1.25
// caption      12.0  regular  0.4
// overline     10.0  regular  1.5
