import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/widgets/custom_count_container.dart';

class HomeCountSection extends StatelessWidget {
  const HomeCountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        CustomCountContainer(
          count: '12',
          title: LocaleKeys.total_donations.tr(),
          color: Theme.of(context).extension<AppColors>()!.primaryColor,
        ),
        CustomCountContainer(
          count: '45',
          title: LocaleKeys.Meals_Served.tr(),
          color: Theme.of(context).extension<AppColors>()!.orangeColor,
        ),
        CustomCountContainer(
          count: '8',
          title: LocaleKeys.This_Month.tr(),
          color: Theme.of(context).extension<AppColors>()!.blueColor,
        ),
      ],
    );
  }
}
