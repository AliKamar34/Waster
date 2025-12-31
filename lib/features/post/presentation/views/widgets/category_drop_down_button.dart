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
      items: [
        DropdownMenuItem(
          value: 'Meat Left Overs',
          child: Text(LocaleKeys.meat_left_overs.tr()),
        ),
        DropdownMenuItem(
          value: 'Vegetables Left Overs',
          child: Text(LocaleKeys.vegetables_left_overs.tr()),
        ),
        DropdownMenuItem(
          value: 'Fruits Left Overs',
          child: Text(LocaleKeys.fruits_left_overs.tr()),
        ),
        DropdownMenuItem(value: 'Other', child: Text(LocaleKeys.Other.tr())),
      ],
    );
  }
}
