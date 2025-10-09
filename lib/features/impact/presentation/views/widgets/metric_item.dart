import 'package:flutter/material.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/themes/app_text_style.dart';

class MetricItem extends StatelessWidget {
  const MetricItem({super.key, required this.value, required this.title});
  final String value, title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: AppTextStyle.styleRegular24(
            context,
          ).copyWith(color: AppColors.primaryColor),
        ),
        Text(title, style: AppTextStyle.styleRegular14(context)),
      ],
    );
  }
}
