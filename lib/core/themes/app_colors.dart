// import 'package:flutter/material.dart';
// import 'theme_controller.dart';

// class AppColors {
//   static bool get _isDark => ThemeController.instance.isDark;
//   static Color get blackTextColor =>
//       _isDark ? const Color(0xffEAEAEA) : const Color(0xff333333);
//   static Color get greyTextColor =>
//       _isDark ? const Color(0xffAAAAAA) : const Color(0xff666666);
//   static Color get primaryColor =>
//       _isDark ? const Color(0xff81C784) : const Color(0xff4CAF50);
//   static Color get whiteColor =>
//       _isDark ? const Color(0xff121212) : const Color(0xffFFFFFF);
//   static Color get orangeColor =>
//       _isDark ? const Color(0xffFFB74D) : const Color(0xffFF9800);
//   static Color get scaffoldColor =>
//       _isDark ? const Color(0xff1a1a1a) : const Color(0xffF9F9F9);
//   static Color get blueColor =>
//       _isDark ? const Color(0xff64B5F6) : const Color(0xff03A9F4);
//   static Color get borderColor =>
//       _isDark ? const Color(0xff2C2C2C) : const Color(0xffF3F3F5);
//   static Color get redColor =>
//       _isDark ? const Color(0xffE57373) : const Color(0xffD4183D);
// }
import 'package:flutter/material.dart';

@immutable
class AppColors extends ThemeExtension<AppColors> {
  final Color blackTextColor;
  final Color greyTextColor;
  final Color primaryColor;
  final Color whiteColor;
  final Color orangeColor;
  final Color scaffoldColor;
  final Color blueColor;
  final Color borderColor;
  final Color redColor;

  const AppColors({
    required this.blackTextColor,
    required this.greyTextColor,
    required this.primaryColor,
    required this.whiteColor,
    required this.orangeColor,
    required this.scaffoldColor,
    required this.blueColor,
    required this.borderColor,
    required this.redColor,
  });

  @override
  AppColors copyWith({
    Color? blackTextColor,
    Color? greyTextColor,
    Color? primaryColor,
    Color? whiteColor,
    Color? orangeColor,
    Color? scaffoldColor,
    Color? blueColor,
    Color? borderColor,
    Color? redColor,
  }) {
    return AppColors(
      blackTextColor: blackTextColor ?? this.blackTextColor,
      greyTextColor: greyTextColor ?? this.greyTextColor,
      primaryColor: primaryColor ?? this.primaryColor,
      whiteColor: whiteColor ?? this.whiteColor,
      orangeColor: orangeColor ?? this.orangeColor,
      scaffoldColor: scaffoldColor ?? this.scaffoldColor,
      blueColor: blueColor ?? this.blueColor,
      borderColor: borderColor ?? this.borderColor,
      redColor: redColor ?? this.redColor,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;
    return AppColors(
      blackTextColor: Color.lerp(blackTextColor, other.blackTextColor, t)!,
      greyTextColor: Color.lerp(greyTextColor, other.greyTextColor, t)!,
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t)!,
      whiteColor: Color.lerp(whiteColor, other.whiteColor, t)!,
      orangeColor: Color.lerp(orangeColor, other.orangeColor, t)!,
      scaffoldColor: Color.lerp(scaffoldColor, other.scaffoldColor, t)!,
      blueColor: Color.lerp(blueColor, other.blueColor, t)!,
      borderColor: Color.lerp(borderColor, other.borderColor, t)!,
      redColor: Color.lerp(redColor, other.redColor, t)!,
    );
  }

  static const light = AppColors(
    blackTextColor: Color(0xff333333),
    greyTextColor: Color(0xff666666),
    primaryColor: Color(0xff4CAF50),
    whiteColor: Color(0xffFFFFFF),
    orangeColor: Color(0xffFF9800),
    scaffoldColor: Color(0xffF9F9F9),
    blueColor: Color(0xff03A9F4),
    borderColor: Color(0xffF3F3F5),
    redColor: Color(0xffD4183D),
  );

  static const dark = AppColors(
    blackTextColor: Color(0xffEAEAEA),
    greyTextColor: Color(0xffAAAAAA),
    primaryColor: Color(0xff81C784),
    whiteColor: Color(0xff121212),
    orangeColor: Color(0xffFFB74D),
    scaffoldColor: Color(0xff1a1a1a),
    blueColor: Color(0xff64B5F6),
    borderColor: Color(0xff2C2C2C),
    redColor: Color(0xffE57373),
  );
}
