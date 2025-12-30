import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:waster/core/constants/assets.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/themes/app_text_style.dart';

class CustomAlert extends StatelessWidget {
  const CustomAlert({
    super.key,
    required this.content,
    required this.title,
    required this.button1,
    required this.button2,
  });
  final String content;
  final String title;
  final Widget button1, button2;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 16.w),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      backgroundColor: Theme.of(context).extension<AppColors>()!.scaffoldColor,
      icon: CircleAvatar(
        radius: 40,
        backgroundColor: Theme.of(context).extension<AppColors>()!.redColor,
        child: SvgPicture.asset(Assets.warningAvatar),
      ),
      iconPadding: EdgeInsets.symmetric(vertical: 40.w),
      title: Text(title, style: AppTextStyle.styleBold20(context)),
      titlePadding: EdgeInsets.only(bottom: 10.h),
      contentPadding: EdgeInsets.symmetric(horizontal: 40.h),
      content: Text(
        content,
        style: AppTextStyle.styleBold20(context),
        textAlign: TextAlign.center,
      ),
      actionsPadding: EdgeInsets.all(20.w),
      actions: [
        Row(
          spacing: 10,
          children: [
            Expanded(child: button1),
            Expanded(child: button2),
          ],
        ),
      ],
    );
  }
}
