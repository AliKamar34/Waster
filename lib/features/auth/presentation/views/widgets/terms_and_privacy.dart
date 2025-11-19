import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
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
          checkColor: Theme.of(context).extension<AppColors>()!.greyTextColor,
          activeColor: Theme.of(context).extension<AppColors>()!.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.r),
          ),
          side: BorderSide(
            color: Theme.of(context).extension<AppColors>()!.greyTextColor,
            width: 1.5,
          ),
          value: isChecked,
          onChanged: onChanged,
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              text: LocaleKeys.i_agree_to_the.tr(),
              style: AppTextStyle.styleRegular16(context).copyWith(
                color: Theme.of(context).extension<AppColors>()!.blackTextColor,
              ),
              children: [
                TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => log('Terms of Services clicked'),
                  text: LocaleKeys.Terms_of_Service.tr(),
                  style: AppTextStyle.styleBold16(context).copyWith(
                    color: Theme.of(
                      context,
                    ).extension<AppColors>()!.primaryColor,
                    decoration: TextDecoration.underline,
                  ),
                ),
                TextSpan(
                  text: LocaleKeys.and.tr(),
                  style: AppTextStyle.styleBold16(context).copyWith(
                    color: Theme.of(
                      context,
                    ).extension<AppColors>()!.blackTextColor,
                  ),
                ),
                TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => log('Privacy Policy clicked'),
                  text: LocaleKeys.Privacy_Policy.tr(),
                  style: AppTextStyle.styleBold16(context).copyWith(
                    color: Theme.of(
                      context,
                    ).extension<AppColors>()!.primaryColor,
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
