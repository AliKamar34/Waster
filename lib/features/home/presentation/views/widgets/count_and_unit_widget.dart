import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/utils/validators.dart';
import 'package:waster/core/widgets/custom_drop_down_button.dart';
import 'package:waster/core/widgets/custom_text_feild.dart';

class CountAndUnitWidget extends StatelessWidget {
  const CountAndUnitWidget({
    super.key,
    this.onChanged,
    required this.quantityController,
  });
  final void Function(String?)? onChanged;
  final TextEditingController quantityController;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 6,
      children: [
        Expanded(
          child: CustomTextFeild(
            lable: '${LocaleKeys.quantity.tr()} *',
            hint: '25',
            controller: quantityController,
            validator: Validators.normal,
          ),
        ),
        Expanded(
          child: CustomDropDownButton(
            onChanged: onChanged,
            validator: Validators.normal,
            items: const [
              DropdownMenuItem(value: 'Unit 1', child: Text('Unit 1')),
              DropdownMenuItem(value: 'Unit 2', child: Text('Unit 2')),
              DropdownMenuItem(value: 'Unit 3', child: Text('Unit 3')),
            ],
            lable: LocaleKeys.unit.tr(),
            hint: LocaleKeys.lbs.tr(),
          ),
        ),
      ],
    );
  }
}
