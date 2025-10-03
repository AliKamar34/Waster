import 'package:flutter/material.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/themes/app_text_style.dart';
import 'package:waster/core/widgets/custom_container.dart';

class ImpactOfMonthWidget extends StatelessWidget {
  const ImpactOfMonthWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      backgroundColor: AppColors.primaryColor.withAlpha(13),
      borderColor: AppColors.primaryColor.withAlpha(51),
      child: Column(
        spacing: 8,
        children: [
          Text(
            'Your Impact This Month',
            style: AppTextStyle.styleRegular16(
              context,
            ).copyWith(color: AppColors.primaryColor),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    '150 lbs',
                    style: AppTextStyle.styleRegular18(
                      context,
                    ).copyWith(color: AppColors.primaryColor),
                  ),
                  Text(
                    'Food Rescued',
                    style: AppTextStyle.styleRegular14(context),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    '75 kg',
                    style: AppTextStyle.styleRegular18(
                      context,
                    ).copyWith(color: AppColors.primaryColor),
                  ),
                  Text(
                    'CO₂ Saved',
                    style: AppTextStyle.styleRegular14(context),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
