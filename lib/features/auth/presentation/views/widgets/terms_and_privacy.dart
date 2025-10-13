import 'dart:developer';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/themes/app_text_style.dart';

class TermsAndPrivacy extends StatelessWidget {
  const TermsAndPrivacy({
    super.key,
    required this.isChecked,
    required this.onChanged,
  });
  final bool isChecked;
  final ValueChanged<bool?> onChanged;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          checkColor: AppColors.greyTextColor,
          activeColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          side: BorderSide(color: AppColors.greyTextColor, width: 1.5),
          value: isChecked,
          onChanged: onChanged,
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              text: 'I agree to the ',
              style: AppTextStyle.styleRegular16(
                context,
              ).copyWith(color: AppColors.blackTextColor),
              children: [
                TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => log('Terms of Services clicked'),
                  text: 'Terms of Service',
                  style: AppTextStyle.styleBold16(context).copyWith(
                    color: AppColors.primaryColor,
                    decoration: TextDecoration.underline,
                  ),
                ),
                TextSpan(
                  text: ' and ',
                  style: AppTextStyle.styleBold16(
                    context,
                  ).copyWith(color: AppColors.blackTextColor),
                ),
                TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => log('Privacy Policy clicked'),
                  text: 'Privacy Policy',
                  style: AppTextStyle.styleBold16(context).copyWith(
                    color: AppColors.primaryColor,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
