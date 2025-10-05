import 'package:flutter/material.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/themes/app_text_style.dart';

class QuantityAndTimeSection extends StatelessWidget {
  const QuantityAndTimeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          spacing: 4,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Quantity',
              style: AppTextStyle.styleRegular16(
                context,
              ).copyWith(color: AppColors.greyTextColor),
            ),
            Text('50 servings', style: AppTextStyle.styleRegular16(context)),
          ],
        ),
        Column(
          spacing: 4,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pickup Time',
              style: AppTextStyle.styleRegular16(
                context,
              ).copyWith(color: AppColors.greyTextColor),
            ),
            Text('2:00 PM', style: AppTextStyle.styleRegular16(context)),
          ],
        ),
      ],
    );
  }
}
