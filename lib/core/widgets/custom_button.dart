import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/themes/app_text_style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    this.onPressed,
    this.borderColor,
    this.backgroundColor,
    this.icon,
  });
  final String title;
  final void Function()? onPressed;
  final Color? backgroundColor;
  final Color? borderColor;
  final Widget? icon;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 40.h),
        backgroundColor:
            backgroundColor ??
            Theme.of(context).extension<AppColors>()!.primaryColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: borderColor ?? backgroundColor ?? Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon == null ? const SizedBox.shrink() : icon!,
          icon == null ? const SizedBox.shrink() : const SizedBox(width: 6),
          Text(
            title,
            style: AppTextStyle.styleBold20(context).copyWith(
              color:
                  borderColor ??
                  Theme.of(context).extension<AppColors>()!.whiteColor,
            ),
          ),
        ],
      ),
    );
  }
}
