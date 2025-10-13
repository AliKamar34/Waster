import 'package:flutter/material.dart';
import 'theme_controller.dart';

class AppColors {
  static bool get _isDark => ThemeController.instance.isDark;
  static Color get blackTextColor =>
      _isDark ? const Color(0xffEAEAEA) : const Color(0xff333333);
  static Color get greyTextColor =>
      _isDark ? const Color(0xffAAAAAA) : const Color(0xff666666);
  static Color get primaryColor =>
      _isDark ? const Color(0xff81C784) : const Color(0xff4CAF50);
  static Color get whiteColor =>
      _isDark ? const Color(0xff121212) : const Color(0xffFFFFFF);
  static Color get orangeColor =>
      _isDark ? const Color(0xffFFB74D) : const Color(0xffFF9800);
  static Color get scaffoldColor =>
      _isDark ? const Color(0xff1a1a1a) : const Color(0xffF9F9F9);
  static Color get blueColor =>
      _isDark ? const Color(0xff64B5F6) : const Color(0xff03A9F4);
  static Color get borderColor =>
      _isDark ? const Color(0xff2C2C2C) : const Color(0xffF3F3F5);
  static Color get redColor =>
      _isDark ? const Color(0xffE57373) : const Color(0xffD4183D);
}
