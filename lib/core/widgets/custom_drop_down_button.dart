import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  final dynamic selectedValue;
  @override
  Widget build(BuildContext context) {
    T? dropdownValue;
    if (selectedValue != null) {
      final existsInItems = items.any(
        (item) => item.value.toString() == selectedValue.toString(),
      );

      if (existsInItems) {
        dropdownValue = items
            .firstWhere(
              (item) => item.value.toString() == selectedValue.toString(),
            )
            .value;
      } else {
        dropdownValue = null;
      }
    }

    return Column(
      spacing: 4,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(lable, style: AppTextStyle.styleRegular16(context)),
        DropdownButtonFormField<T>(
          initialValue: dropdownValue,
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
            contentPadding: EdgeInsets.symmetric(
              horizontal: 12.h,
              vertical: 12.w,
            ),
          ),
          icon: RotatedBox(
            quarterTurns: context.locale == const Locale('ar') ? 1 : 3,
            child: Icon(Icons.arrow_back_ios_new_outlined, size: 20.sp),
          ),
          dropdownColor: Theme.of(context).extension<AppColors>()!.borderColor,
          borderRadius: BorderRadius.circular(8.r),
        ),
      ],
    );
  }

  OutlineInputBorder borderBuilder(BuildContext context) {
    return OutlineInputBorder(
      gapPadding: 18.w,
      borderRadius: BorderRadius.circular(8.r),
      borderSide: BorderSide(
        color: Theme.of(context).extension<AppColors>()!.borderColor,
      ),
    );
  }
}
