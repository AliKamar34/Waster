import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/themes/app_text_style.dart';
import 'package:waster/core/widgets/custom_container.dart';
import 'package:waster/core/widgets/custom_light_color_container.dart';
import 'package:waster/features/impact/presentation/views/widgets/month_donation_info_widget.dart';

class MonthlyGoalsSection extends StatelessWidget {
  const MonthlyGoalsSection({super.key, required this.current});
  final int current;
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        spacing: 16,
        children: [
          Row(
            spacing: 8,
            children: [
              CustomLightColorContainer(
                padding: 8,
                color: Theme.of(context).extension<AppColors>()!.primaryColor,
                child: Icon(
                  Icons.ads_click,
                  color: Theme.of(context).extension<AppColors>()!.primaryColor,
                ),
              ),
              Text(
                LocaleKeys.monthly_goals.tr(),
                style: AppTextStyle.styleRegular18(context),
              ),
            ],
          ),
          MonthDonationInfoWidget(
            month: 'Community Impact',
            current: current,
            goal: 10,
          ),
        ],
      ),
    );
  }
}
