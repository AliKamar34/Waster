import 'package:flutter/material.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/themes/app_text_style.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hint,
    this.suffixIcon,
    this.isPassword,
    this.validator,
    this.controller,
    this.lable,
    this.prefixIcon,
    this.maxLines,
  });
  final String hint;
  final String? lable;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? isPassword;
  final int? maxLines;
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
          maxLines: maxLines ?? 1,
          controller: controller,
          validator: validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          cursorColor: Theme.of(context).extension<AppColors>()!.greyTextColor,
          obscureText: isPassword ?? false,
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
            hintText: hint,
            hintStyle: AppTextStyle.styleRegular16(context),
            suffixIcon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: suffixIcon,
            ),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: prefixIcon,
            ),

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
