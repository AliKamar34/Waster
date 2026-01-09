import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/themes/app_text_style.dart';

class CustomDropDownMenu<T> extends StatelessWidget {
  const CustomDropDownMenu({
    super.key,
    this.validator,
    required this.items,
    this.onSelected,
    required this.label,
    required this.hint,
    this.selectedValue,
  });

  final String? Function(T?)? validator;
  final List<DropdownMenuEntry<T>> items;
  final void Function(T?)? onSelected;
  final String label, hint;
  final T? selectedValue;

  @override
  Widget build(BuildContext context) {
    return FormField<T>(
      initialValue: selectedValue,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      builder: (state) {
        final controller = TextEditingController();
        if (state.value != null) {
          final entry = items.where((e) => e.value == state.value).firstOrNull;
          if (entry != null) {
            controller.text = entry.label;
          }
        }
        final hasError = state.hasError;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: AppTextStyle.styleRegular16(context)),
            const SizedBox(height: 4),
            DropdownMenu<T>(
              errorText: hasError ? state.errorText : null,
              width: double.infinity,
              menuHeight: 200.h,
              enableFilter: true,
              requestFocusOnTap: true,
              controller: controller,
              initialSelection: state.value,
              hintText: hint,
              onSelected: (value) {
                state.didChange(value);
                onSelected?.call(value);
              },
              dropdownMenuEntries: items,
              trailingIcon: RotatedBox(
                quarterTurns: 3,
                child: Icon(Icons.arrow_back_ios_new_outlined, size: 20.sp),
              ),
              selectedTrailingIcon: RotatedBox(
                quarterTurns: 1,
                child: Icon(Icons.arrow_back_ios_new_outlined, size: 20.sp),
              ),
              inputDecorationTheme: InputDecorationTheme(
                filled: true,
                fillColor: Theme.of(
                  context,
                ).extension<AppColors>()!.borderColor,
                isDense: true,
                constraints: BoxConstraints.tight(const Size.fromHeight(50)),
                contentPadding: EdgeInsets.symmetric(horizontal: 12.h),
                border: borderBuilder(context, hasError: hasError),
                enabledBorder: borderBuilder(context, hasError: hasError),
                focusedBorder: borderBuilder(context, hasError: hasError),
              ),
              menuStyle: MenuStyle(
                backgroundColor: WidgetStateProperty.all(
                  Theme.of(context).extension<AppColors>()!.borderColor,
                ),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                elevation: WidgetStateProperty.all(4),
                maximumSize: WidgetStateProperty.all(
                  const Size(double.infinity, 200),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  OutlineInputBorder borderBuilder(
    BuildContext context, {
    required bool hasError,
  }) {
    return OutlineInputBorder(
      gapPadding: 8.w,
      borderRadius: BorderRadius.circular(8.r),
      borderSide: BorderSide(
        color: hasError
            ? Theme.of(context).extension<AppColors>()!.redColor
            : Theme.of(context).extension<AppColors>()!.borderColor,
      ),
    );
  }
}
