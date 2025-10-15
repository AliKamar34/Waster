import 'package:flutter/material.dart';
import 'package:waster/core/themes/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme() => ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.light.primaryColor,
    scaffoldBackgroundColor: AppColors.light.scaffoldColor,
    extensions: const [AppColors.light],
  );
  static ThemeData darkTheme() => ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.dark.primaryColor,
    scaffoldBackgroundColor: AppColors.dark.scaffoldColor,
    extensions: const [AppColors.dark],
  );
}
