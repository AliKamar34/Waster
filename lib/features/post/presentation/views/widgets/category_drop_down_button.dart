import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/utils/validators.dart';
import 'package:waster/core/widgets/custom_drop_down_button.dart';

class CategoryDropDownButton extends StatelessWidget {
  const CategoryDropDownButton({super.key, this.onChanged, this.selectedValue});
  final void Function(String?)? onChanged;
  final String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return CustomDropDownButton(
      lable: LocaleKeys.category.tr(),
      hint: LocaleKeys.Select_food_category.tr(),
      onChanged: onChanged,
      validator: Validators.normal,
      selectedValue: selectedValue,
      items: const [
        DropdownMenuItem(value: 'category 1', child: Text('category 1')),
        DropdownMenuItem(value: 'category 2', child: Text('category 2')),
        DropdownMenuItem(value: 'category 3', child: Text('category 3')),
      ],
    );
  }
}
