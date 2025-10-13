import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:waster/core/constants/assets.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/themes/app_text_style.dart';
import 'package:waster/core/widgets/custom_light_color_container.dart';
import 'package:waster/features/impact/presentation/views/widgets/impact_metrics_row.dart';

class EnvironmentalImpactSection extends StatelessWidget {
  const EnvironmentalImpactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Environmental Impact',
          style: AppTextStyle.styleRegular18(context),
        ),
        CustomLightColorContainer(
          color: AppColors.primaryColor,
          child: Column(
            spacing: 10,
            children: [
              SvgPicture.asset(
                Assets.leaf,
                width: 40,
                height: 40,
                colorFilter: ColorFilter.mode(
                  AppColors.primaryColor,
                  BlendMode.srcIn,
                ),
              ),
              Text(
                'Carbon Footprint Reduction',
                style: AppTextStyle.styleRegular16(
                  context,
                ).copyWith(color: AppColors.primaryColor),
              ),
              const ImpactMetricsRow(),
            ],
          ),
        ),
      ],
    );
  }
}
