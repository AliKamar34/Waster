import 'package:flutter/material.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/themes/app_text_style.dart';

class CustomTextFeild extends StatelessWidget {
  const CustomTextFeild({
    super.key,
    required this.hint,
    this.suffixIcon,
    this.isPassword,
    this.validator,
    this.controller,
    this.lable,
  });
  final String hint;
  final String? lable;
  final Widget? suffixIcon;
  final bool? isPassword;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 4,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        lable == null
            ? const SizedBox()
            : Text(lable!, style: AppTextStyle.styleRegular16(context)),
        TextFormField(
          controller: controller,
          validator: validator,
          cursorColor: AppColors.greyTextColor,
          obscureText: isPassword ?? false,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.scaffoldColor,
            border: borderBuilder(),
            enabledBorder: borderBuilder(),
            focusedBorder: borderBuilder(),
            errorBorder: borderBuilder().copyWith(
              borderSide: const BorderSide(color: AppColors.redColor),
            ),
            focusedErrorBorder: borderBuilder().copyWith(
              borderSide: const BorderSide(color: AppColors.redColor),
            ),
            hintText: hint,
            hintStyle: AppTextStyle.styleRegular16(context),
            suffixIcon: suffixIcon,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
          ),
        ),
      ],
    );
  }

  OutlineInputBorder borderBuilder() {
    return OutlineInputBorder(
      gapPadding: 18,
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: AppColors.scaffoldColor),
    );
  }
}
