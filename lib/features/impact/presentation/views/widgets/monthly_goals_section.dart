import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/themes/app_text_style.dart';
import 'package:waster/core/widgets/custom_container.dart';
import 'package:waster/features/impact/presentation/views/widgets/month_donation_info_widget.dart';

class MonthlyGoalsSection extends StatelessWidget {
  const MonthlyGoalsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.monthly_goals.tr(),
          style: AppTextStyle.styleRegular18(context),
        ),
        CustomContainer(
          child: Column(
            spacing: 16,
            children: [
              MonthDonationInfoWidget(
                month: LocaleKeys.jan.tr(),
                current: 8,
                goal: 10,
              ),
              MonthDonationInfoWidget(
                month: LocaleKeys.feb.tr(),
                current: 12,
                goal: 10,
              ),
              MonthDonationInfoWidget(
                month: LocaleKeys.mar.tr(),
                current: 5,
                goal: 10,
              ),
              MonthDonationInfoWidget(
                month: LocaleKeys.apr.tr(),
                current: 3,
                goal: 10,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
