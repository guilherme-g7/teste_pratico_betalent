import 'package:flutter/material.dart';

import 'colors.dart';

abstract final class AppTheme {
  static const _textTheme = TextTheme(
    headlineLarge: TextStyle(
      fontFamily: 'Helvetica',
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),
    headlineMedium: TextStyle(
      fontFamily: 'Helvetica',
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    headlineSmall: TextStyle(
      fontFamily: 'Helvetica',
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    titleMedium: TextStyle(
      fontFamily: 'Helvetica',
      fontSize: 18,
      fontWeight: FontWeight.w500,
    ),
    bodyLarge: TextStyle(
      fontFamily: 'Helvetica',
      fontSize: 18,
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'Helvetica',
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    bodySmall: TextStyle(
      fontFamily: 'Helvetica',
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.grey3,
    ),
    labelSmall: TextStyle(
      fontFamily: 'Helvetica',
      fontSize: 10,
      fontWeight: FontWeight.w500,
      color: AppColors.grey3,
    ),
    labelLarge: TextStyle(
      fontFamily: 'Helvetica',
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: AppColors.grey3,
    ),
  );

  static const _inputDecorationTheme = InputDecorationTheme(
    hintStyle: TextStyle(
      fontFamily: 'Helvetica',
      color: AppColors.grey3,
      fontSize: 18.0,
      fontWeight: FontWeight.w400,
    ),
  );

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: AppColors.lightColorScheme,
    textTheme: _textTheme,
    inputDecorationTheme: _inputDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: AppColors.darkColorScheme,
    textTheme: _textTheme,
    inputDecorationTheme: _inputDecorationTheme,
  );
}