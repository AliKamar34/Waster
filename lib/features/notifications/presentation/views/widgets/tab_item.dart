import 'package:flutter/material.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/themes/app_text_style.dart';
import 'package:waster/core/widgets/custom_container.dart';

class TabItem extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const TabItem({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CustomContainer(
        padding: 6,
        backgroundColor: isSelected
            ? AppColors.primaryColor
            : AppColors.scaffoldColor,
        borderWidth: 2,
        child: Center(
          child: Text(
            label,
            style: AppTextStyle.styleRegular16(context).copyWith(
              color: isSelected
                  ? AppColors.whiteColor
                  : AppColors.blackTextColor,
            ),
          ),
        ),
      ),
    );
  }
}
