import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/utils/validators.dart';
import 'package:waster/core/widgets/custom_drop_down_button.dart';

class CategoryDropDownButton extends StatelessWidget {
  const CategoryDropDownButton({
    super.key,
    this.onSelected,
    this.selectedValue,
  });
  final void Function(String?)? onSelected;
  final String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return CustomDropDownMenu<String>(
      label: LocaleKeys.category.tr(),
      hint: LocaleKeys.Select_food_category.tr(),
      onSelected: onSelected,
      validator: Validators.normal,
      selectedValue: selectedValue,
      items: [
        DropdownMenuEntry(
          value: 'Meat Left Overs',
          label: LocaleKeys.meat_left_overs.tr(),
        ),
        DropdownMenuEntry(
          value: 'Vegetables Left Overs',
          label: LocaleKeys.vegetables_left_overs.tr(),
        ),
        DropdownMenuEntry(
          value: 'Fruits Left Overs',
          label: LocaleKeys.fruits_left_overs.tr(),
        ),
        DropdownMenuEntry(value: 'Other', label: LocaleKeys.Other.tr()),
      ],
    );
  }
}
