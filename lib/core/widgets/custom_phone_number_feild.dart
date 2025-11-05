import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/themes/app_text_style.dart';

class CustomPhoneNumberFeild extends StatelessWidget {
  const CustomPhoneNumberFeild({super.key, this.controller});
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 4,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.phone_number.tr(),
          style: AppTextStyle.styleRegular16(context),
        ),
        IntlPhoneField(
          initialCountryCode: 'EG',
          controller: controller,
          validator: (value) {
            if (value == null || value.number.isEmpty) {
              return LocaleKeys.please_enter_your_phone_number.tr();
            }
            return null;
          },
          decoration: InputDecoration(
            filled: true,
            fillColor: Theme.of(context).extension<AppColors>()!.borderColor,
            errorMaxLines: 2,
            border: borderBuilder(context),
            enabledBorder: borderBuilder(context),
            focusedBorder: borderBuilder(context),
            errorBorder: borderBuilder(context).copyWith(
              borderSide: BorderSide(
                color: Theme.of(context).extension<AppColors>()!.redColor,
              ),
            ),
            focusedErrorBorder: borderBuilder(context).copyWith(
              borderSide: BorderSide(
                color: Theme.of(context).extension<AppColors>()!.redColor,
              ),
            ),
            hintText: '1234567890',
            hintStyle: AppTextStyle.styleRegular16(context),

            prefixIconConstraints: const BoxConstraints(),
            suffixIconConstraints: const BoxConstraints(),
            contentPadding: const EdgeInsets.symmetric(vertical: 12),
          ),
        ),
      ],
    );
  }

  OutlineInputBorder borderBuilder(BuildContext context) {
    return OutlineInputBorder(
      gapPadding: 18,
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: Theme.of(context).extension<AppColors>()!.borderColor,
      ),
    );
  }
}
