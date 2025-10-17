import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/themes/app_text_style.dart';
import 'package:waster/core/widgets/custom_light_color_container.dart';

class ImpactOfMonthWidget extends StatelessWidget {
  const ImpactOfMonthWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomLightColorContainer(
      color: Theme.of(context).extension<AppColors>()!.primaryColor,
      child: Column(
        spacing: 8,
        children: [
          Text(
            LocaleKeys.your_impact_this_month.tr(),
            style: AppTextStyle.styleRegular16(context).copyWith(
              color: Theme.of(context).extension<AppColors>()!.primaryColor,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    '150 ${LocaleKeys.lbs.tr()}',
                    style: AppTextStyle.styleRegular18(context).copyWith(
                      color: Theme.of(
                        context,
                      ).extension<AppColors>()!.primaryColor,
                    ),
                  ),
                  Text(
                    LocaleKeys.food_rescued.tr(),
                    style: AppTextStyle.styleRegular14(context),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    '75 ${LocaleKeys.kg.tr()}',
                    style: AppTextStyle.styleRegular18(context).copyWith(
                      color: Theme.of(
                        context,
                      ).extension<AppColors>()!.primaryColor,
                    ),
                  ),
                  Text(
                    LocaleKeys.co_saved.tr(),
                    style: AppTextStyle.styleRegular14(context),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
