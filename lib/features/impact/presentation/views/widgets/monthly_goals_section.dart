import 'package:flutter/material.dart';
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
        Text('Monthly Goals', style: AppTextStyle.styleRegular18(context)),
        const CustomContainer(
          child: Column(
            spacing: 16,
            children: [
              MonthDonationInfoWidget(month: 'Jan', current: 8, goal: 10),
              MonthDonationInfoWidget(month: 'Feb', current: 12, goal: 10),
              MonthDonationInfoWidget(month: 'Mar', current: 5, goal: 10),
              MonthDonationInfoWidget(month: 'Apr', current: 3, goal: 10),
            ],
          ),
        ),
      ],
    );
  }
}
