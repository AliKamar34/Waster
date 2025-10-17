import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/widgets/custom_count_container.dart';

class ProfileStatisticsSection extends StatelessWidget {
  const ProfileStatisticsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        CustomCountContainer(
          count: '1,247',
          title: LocaleKeys.Meals_Donated.tr(),
          color: Theme.of(context).extension<AppColors>()!.primaryColor,
        ),
        CustomCountContainer(
          count: '892 ${LocaleKeys.lbs.tr()}',
          title: LocaleKeys.pounds_saved.tr(),
          color: Theme.of(context).extension<AppColors>()!.primaryColor,
        ),
        CustomCountContainer(
          count: '23',
          title: LocaleKeys.Organizations_Helped.tr(),
          color: Theme.of(context).extension<AppColors>()!.primaryColor,
        ),
      ],
    );
  }
}
