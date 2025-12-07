import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/utils/validators.dart';
import 'package:waster/core/widgets/custom_drop_down_button.dart';
import 'package:waster/core/widgets/custom_text_field.dart';

class CountAndUnitWidget extends StatelessWidget {
  const CountAndUnitWidget({
    super.key,
    this.onChanged,
    required this.quantityController,
    this.units,
  });
  final void Function(String?)? onChanged;
  final TextEditingController quantityController;
  final String? units;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 6,
      children: [
        Expanded(
          child: CustomTextField(
            lable: '${LocaleKeys.quantity.tr()} *',
            hint: '25',
            controller: quantityController,
            validator: Validators.normal,
          ),
        ),
        Expanded(
          child: CustomDropDownButton(
            selectedValue: units,
            onChanged: onChanged,
            validator: Validators.normal,
            items: [
              DropdownMenuItem(value: 'Ton', child: Text(LocaleKeys.Ton.tr())),
              DropdownMenuItem(
                value: 'Kilogram',
                child: Text(LocaleKeys.Kilogram.tr()),
              ),
              DropdownMenuItem(
                value: 'Pound',
                child: Text(LocaleKeys.Pound.tr()),
              ),
              DropdownMenuItem(
                value: 'Pieces',
                child: Text(LocaleKeys.pieces.tr()),
              ),
            ],
            lable: LocaleKeys.unit.tr(),
            hint: LocaleKeys.lbs.tr(),
          ),
        ),
      ],
    );
  }
}
