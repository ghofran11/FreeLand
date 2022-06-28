import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';
import 'styles.dart';

class AppThemes {
  AppThemes._internal();

  static final ThemeData lightThemeData = ThemeData(
      tabBarTheme: TabBarTheme(
          labelColor: AppColors.primary,
          unselectedLabelColor: AppColors.primary.withOpacity(0.4)),
      brightness: Brightness.light,
      fontFamily: fontFamily,
      primaryColor: AppColors.primary,
      checkboxTheme: const CheckboxThemeData(
          side: BorderSide(
        color: AppColors.primary,
      )),
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
          backgroundColor: AppColors.white,
          side: BorderSide(color: AppColors.primary, width: 1.5),
          labelStyle: TextStyle(color: AppColors.primary)),
      // primarySwatch: AppColors.accent as MaterialColor,
      colorScheme: ThemeData.light().colorScheme.copyWith(
          primary: AppColors.primary,
          secondary: AppColors.accent,
          primaryContainer: AppColors.white,
          onSecondary: AppColors.primary),
      inputDecorationTheme: inputDecorationThemeLight);

// static final ThemeData darkThemeData = ThemeData(
//     brightness: Brightness.dark,
//     primaryColor: AppColors.primary,
//     fontFamily: fontFamily,
//     textSelectionTheme: const TextSelectionThemeData(
//       cursorColor: AppColors.primary,
//     ),
//     appBarTheme: const AppBarTheme(
//       elevation: 0,
//       //     titleTextStyle: TextStyle(color: AppColors.white),
//       iconTheme: IconThemeData(color: AppColors.white),
//       systemOverlayStyle: SystemUiOverlayStyle.dark,
//     ),
//     cardTheme: cardTheme,
//     dialogTheme: dialogTheme,
//     outlinedButtonTheme: OutlinedButtonThemeData(style: outlineButtonStyle),
//     elevatedButtonTheme: ElevatedButtonThemeData(style: elevatedButtonStyle),
//     textButtonTheme: TextButtonThemeData(style: textButtonStyle),
//     iconTheme: IconThemeData(
//       size: kIconSize.r,
//       color: Colors.white,
//     ),
//
//     // primarySwatch: AppColors.accent as MaterialColor,
//     colorScheme: ThemeData.dark().colorScheme.copyWith(
//         primary: AppColors.primary,
//         secondary: AppColors.accent,
//         primaryContainer: Colors.grey[700]),
//     inputDecorationTheme: inputDecorationThemeDark);
}
