import 'package:flutter/material.dart';
import 'package:waster/core/themes/app_text_style.dart';

class CustomImpactAppBar extends StatelessWidget {
  const CustomImpactAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 4,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Your Impact', style: AppTextStyle.styleBold20(context)),
        Text(
          'See the difference you\'re making',
          style: AppTextStyle.styleRegular14(context),
        ),
      ],
    );
  }
}
