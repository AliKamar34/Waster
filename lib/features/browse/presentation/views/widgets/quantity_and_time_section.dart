import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/themes/app_text_style.dart';

class QuantityAndTimeSection extends StatelessWidget {
  const QuantityAndTimeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          spacing: 4,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.quantity.tr(),
              style: AppTextStyle.styleRegular16(context).copyWith(
                color: Theme.of(context).extension<AppColors>()!.greyTextColor,
              ),
            ),
            Text(
              '50 ${LocaleKeys.servings.tr()}',
              style: AppTextStyle.styleRegular16(context),
            ),
          ],
        ),
        Column(
          spacing: 4,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.pickup_time.tr(),
              style: AppTextStyle.styleRegular16(context).copyWith(
                color: Theme.of(context).extension<AppColors>()!.greyTextColor,
              ),
            ),
            Text(
              '2:00 ${LocaleKeys.pm.tr()}',
              style: AppTextStyle.styleRegular16(context),
            ),
          ],
        ),
      ],
    );
  }
}
