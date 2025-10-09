import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:waster/core/constants/assets.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/themes/app_text_style.dart';
import 'package:waster/core/widgets/custom_light_color_container.dart';
import 'package:waster/features/home/presentation/views/widgets/custom_order_state_widget.dart';
import 'package:waster/features/impact/presentation/views/widgets/custom_impact_grid_view.dart';

class AchievementGridView extends StatelessWidget {
  const AchievementGridView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> badges = [
      {'title': 'First Donation', 'icon': Assets.heart, 'earned': true},
      {'title': 'Green Hero', 'icon': Assets.leaf, 'earned': true},
      {
        'title': 'Community Champion',
        'icon': Assets.community,
        'earned': false,
      },
      {'title': 'Top Donor', 'icon': Assets.cup, 'earned': false},
    ];
    return CustomImpactGridView(
      itemCount: badges.length,
      itemBuilder: (context, index) {
        return CustomLightColorContainer(
          color: badges[index]['earned']
              ? AppColors.primaryColor
              : AppColors.greyTextColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(
                badges[index]['icon'],
                colorFilter: ColorFilter.mode(
                  badges[index]['earned']
                      ? AppColors.primaryColor
                      : AppColors.greyTextColor,
                  BlendMode.srcIn,
                ),
              ),
              Text(
                badges[index]['title'],
                maxLines: 2,
                textAlign: TextAlign.center,
                style: AppTextStyle.styleRegular14(context),
              ),
              CustomOrderStateWidget(
                color: badges[index]['earned']
                    ? AppColors.primaryColor
                    : AppColors.greyTextColor,
                state: badges[index]['earned'] ? 'Earned' : 'Locked',
              ),
            ],
          ),
        );
      },
    );
  }
}
