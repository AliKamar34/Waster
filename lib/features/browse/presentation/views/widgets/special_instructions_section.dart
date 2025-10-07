import 'package:flutter/material.dart';
import 'package:waster/core/themes/app_text_style.dart';
import 'package:waster/core/widgets/custom_container.dart';

class SpecialInstructionsSection extends StatelessWidget {
  const SpecialInstructionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        spacing: 12,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Special Instructions',
            style: AppTextStyle.styleRegular18(context),
          ),
          Text(
            'Please bring insulated bags. Items need to be refr',
            style: AppTextStyle.styleRegular14(context),
          ),
        ],
      ),
    );
  }
}
