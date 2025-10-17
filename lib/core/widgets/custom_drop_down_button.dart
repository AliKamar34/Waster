import 'package:easy_localization/easy_localization.dart';
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
            fillColor: Theme.of(context).extension<AppColors>()!.borderColor,
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
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 12,
            ),
          ),
          icon: RotatedBox(
            quarterTurns: context.locale == const Locale('ar') ? 1 : 3,
            child: const Icon(Icons.arrow_back_ios_new_outlined, size: 20),
          ),
          dropdownColor: Theme.of(context).extension<AppColors>()!.borderColor,
          borderRadius: BorderRadius.circular(8),
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
