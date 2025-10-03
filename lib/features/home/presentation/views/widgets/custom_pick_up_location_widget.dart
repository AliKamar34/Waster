import 'package:flutter/material.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/themes/app_text_style.dart';
import 'package:waster/core/widgets/custom_button.dart';
import 'package:waster/core/widgets/custom_container.dart';

class CustomPickUpLocationWidget extends StatelessWidget {
  const CustomPickUpLocationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      backgroundColor: AppColors.blueColor.withAlpha(13),
      borderColor: AppColors.blueColor.withAlpha(51),
      padding: 16,
      child: Row(
        spacing: 14,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            spacing: 12,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Current Location',
                style: AppTextStyle.styleRegular16(
                  context,
                ).copyWith(color: AppColors.blueColor),
              ),
              Text(
                '123 Main St, City, State',
                style: AppTextStyle.styleRegular14(context),
              ),
            ],
          ),
          Expanded(
            child: CustomButton(
              backgroundColor: AppColors.whiteColor,
              borderColor: AppColors.blueColor,
              title: 'Change',
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
