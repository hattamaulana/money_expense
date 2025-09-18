import 'package:flutter/material.dart';
import 'package:money_expense/themes/colors/colors.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,

    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColor.Primary,
      brightness: Brightness.light,
    ),

    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,

    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColor.Primary,
      brightness: Brightness.dark,
    ),

    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold, 
      ),
      titleMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold, 
      ),
    ),
  );
}