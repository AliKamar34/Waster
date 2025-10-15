import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waster/core/themes/app_colors.dart';

abstract class AppTextStyle {
  static TextStyle styleBold24(context) {
    return GoogleFonts.arimo(
      fontSize: getResponsiveFontSize(context, fontSize: 24),
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle styleBold20(context) {
    return GoogleFonts.arimo(
      fontSize: getResponsiveFontSize(context, fontSize: 20),
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle styleBold16(context) {
    return GoogleFonts.arimo(
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle styleMeduim14(context) {
    return GoogleFonts.arimo(
      fontSize: getResponsiveFontSize(context, fontSize: 14),
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle styleRegular24(context) {
    return GoogleFonts.arimo(
      fontSize: getResponsiveFontSize(context, fontSize: 24),
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleRegular16(context) {
    return GoogleFonts.arimo(
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleRegular14(context) {
    return GoogleFonts.arimo(
      fontSize: getResponsiveFontSize(context, fontSize: 14),
      fontWeight: FontWeight.w600,
      color: Theme.of(context).extension<AppColors>()!.greyTextColor,
    );
  }

  static TextStyle styleRegular18(context) {
    return GoogleFonts.arimo(
      fontSize: getResponsiveFontSize(context, fontSize: 18),
      fontWeight: FontWeight.w600,
    );
  }
}

double getResponsiveFontSize(BuildContext context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;
  double lowerLimit = fontSize * 0.85;
  double upperLimit = fontSize * 1.3;
  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(BuildContext context) {
  double width = MediaQuery.sizeOf(context).width;
  if (width <= 400) {
    return 0.85;
  } else if (width <= 800) {
    return 1.0;
  } else if (width <= 1200) {
    return 1.15;
  } else {
    return 1.25;
  }
}
