import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waster/core/themes/app_colors.dart';

abstract class AppTextStyle {
  static TextStyle styleBold24(context) {
    return GoogleFonts.arimo(fontSize: 24.sp, fontWeight: FontWeight.w700);
  }

  static TextStyle styleBold20(context) {
    return GoogleFonts.arimo(fontSize: 20.sp, fontWeight: FontWeight.w700);
  }

  static TextStyle styleBold16(context) {
    return GoogleFonts.arimo(fontSize: 16.sp, fontWeight: FontWeight.w700);
  }

  static TextStyle styleMeduim14(context) {
    return GoogleFonts.arimo(fontSize: 14.sp, fontWeight: FontWeight.w500);
  }

  static TextStyle styleRegular24(context) {
    return GoogleFonts.arimo(fontSize: 24.sp, fontWeight: FontWeight.w600);
  }

  static TextStyle styleRegular16(context) {
    return GoogleFonts.arimo(fontSize: 16.sp, fontWeight: FontWeight.w600);
  }

  static TextStyle styleRegular14(context) {
    return GoogleFonts.arimo(
      fontSize: 14.sp,
      fontWeight: FontWeight.w600,
      color: Theme.of(context).extension<AppColors>()!.greyTextColor,
    );
  }

  static TextStyle styleRegular18(context) {
    return GoogleFonts.arimo(fontSize: 18.sp, fontWeight: FontWeight.w600);
  }
}
