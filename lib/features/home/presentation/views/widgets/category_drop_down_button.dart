import 'package:flutter/material.dart';
import 'package:waster/core/widgets/custom_drop_down_button.dart';

class CategoryDropDownButton extends StatelessWidget {
  const CategoryDropDownButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomDropDownButton(
      lable: 'Category',
      hint: 'Select food category',
      onChanged: (p0) {},
      validator: (p0) {
        return null;
      },
      items: const [
        DropdownMenuItem(value: 'category 1', child: Text('category 1')),
        DropdownMenuItem(value: 'category 2', child: Text('category 2')),
        DropdownMenuItem(value: 'category 3', child: Text('category 3')),
      ],
    );
  }
}
