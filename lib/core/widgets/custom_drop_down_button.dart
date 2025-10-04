import 'package:flutter/material.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/themes/app_text_style.dart';

class CustomDropDownButton<T> extends StatelessWidget {
  const CustomDropDownButton({
    super.key,
    this.validator,
    required this.items,
    this.onChanged,
    required this.lable,
    required this.hint,
    this.selectedValue,
  });
  final String? Function(T?)? validator;
  final List<DropdownMenuItem<T>> items;
  final void Function(T?)? onChanged;
  final String lable, hint;
  final T? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 4,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(lable, style: AppTextStyle.styleRegular16(context)),
        DropdownButtonFormField<T>(
          value: selectedValue,
          hint: Text(hint, style: AppTextStyle.styleRegular16(context)),
          validator: validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: onChanged,
          items: items.map((item) {
            return DropdownMenuItem<T>(value: item.value, child: item.child);
          }).toList(),
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.borderColor,
            border: borderBuilder(),
            enabledBorder: borderBuilder(),
            focusedBorder: borderBuilder(),
            errorBorder: borderBuilder().copyWith(
              borderSide: const BorderSide(color: AppColors.redColor),
            ),
            focusedErrorBorder: borderBuilder().copyWith(
              borderSide: const BorderSide(color: AppColors.redColor),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 12,
            ),
          ),
          icon: const RotatedBox(
            quarterTurns: 3,
            child: Icon(Icons.arrow_back_ios_new_outlined),
          ),
          dropdownColor: AppColors.borderColor,
          borderRadius: BorderRadius.circular(8),
        ),
      ],
    );
  }

  OutlineInputBorder borderBuilder() {
    return OutlineInputBorder(
      gapPadding: 18,
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: AppColors.borderColor),
    );
  }
}
