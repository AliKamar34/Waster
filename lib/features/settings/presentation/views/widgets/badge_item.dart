import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:waster/core/constants/assets.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/themes/app_text_style.dart';
import 'package:waster/core/widgets/custom_container.dart';

class BadgeItem extends StatelessWidget {
  const BadgeItem({super.key, required this.label});
  final String label;
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      padding: 6,
      borderRadius: 8,
      backgroundColor: Theme.of(context).extension<AppColors>()!.orangeColor,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 4,
        children: [
          SvgPicture.asset(Assets.achievement, height: 16),
          Text(
            label,
            style: AppTextStyle.styleRegular14(context).copyWith(
              color: Theme.of(context).extension<AppColors>()!.whiteColor,
            ),
          ),
        ],
      ),
    );
  }
}
