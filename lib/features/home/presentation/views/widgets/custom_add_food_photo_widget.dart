import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:waster/core/constants/assets.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/themes/app_text_style.dart';
import 'package:waster/core/widgets/custom_button.dart';
import 'package:waster/core/widgets/custom_container.dart';

class CustomAddFoodPhotoWidget extends StatelessWidget {
  const CustomAddFoodPhotoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      padding: 20,
      backgroundColor: AppColors.primaryColor.withAlpha(13),
      borderColor: AppColors.primaryColor.withAlpha(51),
      child: Column(
        children: [
          SvgPicture.asset(Assets.camera),
          const SizedBox(height: 12),
          Text(
            'Add Food Photo',
            style: AppTextStyle.styleRegular16(
              context,
            ).copyWith(color: AppColors.primaryColor),
          ),
          const SizedBox(height: 8),
          Text(
            'Help recipients see what you\'re offering',
            style: AppTextStyle.styleRegular14(context),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: 150,
            child: CustomButton(
              backgroundColor: AppColors.whiteColor,
              borderColor: AppColors.primaryColor,
              title: 'Take Photo',
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
