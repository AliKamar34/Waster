import 'package:flutter/material.dart';
import 'package:waster/core/themes/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme() => ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.scaffoldColor,
  );
  static ThemeData darkTheme() => ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.scaffoldColor,
  );
}
