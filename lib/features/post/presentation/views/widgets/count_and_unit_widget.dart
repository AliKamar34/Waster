import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/utils/validators.dart';
import 'package:waster/core/widgets/custom_drop_down_button.dart';
import 'package:waster/core/widgets/custom_text_field.dart';

class CountAndUnitWidget extends StatelessWidget {
  const CountAndUnitWidget({
    super.key,
    this.onSelected,
    required this.quantityController,
    this.units,
  });
  final void Function(String?)? onSelected;
  final TextEditingController quantityController;
  final String? units;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 6,
      children: [
        Expanded(
          child: CustomTextField(
            keyboardType: TextInputType.number,
            lable: '${LocaleKeys.quantity.tr()} *',
            hint: '25',
            controller: quantityController,
            validator: Validators.normal,
          ),
        ),
        Expanded(
          child: CustomDropDownMenu<String>(
            selectedValue: units,
            onSelected: onSelected,
            validator: Validators.normal,
            items: [
              DropdownMenuEntry(value: 'Ton', label: LocaleKeys.Ton.tr()),
              DropdownMenuEntry(
                value: 'Kilogram',
                label: LocaleKeys.Kilogram.tr(),
              ),
              DropdownMenuEntry(value: 'Pound', label: LocaleKeys.Pound.tr()),
              DropdownMenuEntry(value: 'Pieces', label: LocaleKeys.pieces.tr()),
            ],
            label: LocaleKeys.unit.tr(),
            hint: LocaleKeys.lbs.tr(),
          ),
        ),
      ],
    );
  }
}
