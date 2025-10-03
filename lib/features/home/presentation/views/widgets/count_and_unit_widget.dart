import 'package:flutter/material.dart';
import 'package:waster/core/widgets/custom_drop_down_button.dart';
import 'package:waster/core/widgets/custom_text_feild.dart';

class CountAndUnitWidget extends StatelessWidget {
  const CountAndUnitWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 6,
      children: [
        const Expanded(
          child: CustomTextFeild(lable: 'Quantity *', hint: '25'),
        ),
        Expanded(
          child: CustomDropDownButton(
            onChanged: (p0) {},
            validator: (p0) {
              return null;
            },
            items: const [
              DropdownMenuItem(value: 'Unit 1', child: Text('Unit 1')),
              DropdownMenuItem(value: 'Unit 2', child: Text('Unit 2')),
              DropdownMenuItem(value: 'Unit 3', child: Text('Unit 3')),
            ],
            lable: 'Unit',
            hint: 'lbs',
          ),
        ),
      ],
    );
  }
}
