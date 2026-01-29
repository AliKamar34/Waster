import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/themes/app_text_style.dart';
import 'package:waster/features/impact/presentation/views/widgets/donation_progress_bar.dart';

class MonthDonationInfoWidget extends StatelessWidget {
  const MonthDonationInfoWidget({
    super.key,
    required this.month,
    required this.current,
    required this.goal,
  });
  final String month;
  final int current, goal;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              month,
              style: AppTextStyle.styleRegular14(context).copyWith(
                color: Theme.of(context).extension<AppColors>()!.blackTextColor,
              ),
            ),
            Text(
              '$current / $goal ${LocaleKeys.donations.tr()}',
              style: AppTextStyle.styleRegular14(context),
            ),
          ],
        ),
        DonationProgressBar(current: current, goal: goal),
        Text(
          'You\'re only ${goal - current} donations away from your monthly goal!',
          style: AppTextStyle.styleRegular14(context),
        ),
      ],
    );
  }
}
