import 'package:flutter/material.dart';
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
        minimumSize: const Size(double.infinity, 40),
        backgroundColor: backgroundColor ?? AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: borderColor ?? backgroundColor ?? AppColors.primaryColor,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: onPressed,
      child: Row(
        spacing: 6,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon == null ? const SizedBox.shrink() : icon!,
          Text(
            title,
            style: AppTextStyle.styleBold20(
              context,
            ).copyWith(color: borderColor ?? AppColors.whiteColor),
          ),
        ],
      ),
    );
  }
}
