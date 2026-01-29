import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:waster/core/constants/assets.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/features/impact/presentation/views/widgets/custom_impact_container.dart';

class CustomImpactRow extends StatelessWidget {
  const CustomImpactRow({
    super.key,
    required this.totalDonationsCount,
    required this.mealsServedCount,
  });

  final String totalDonationsCount;
  final String mealsServedCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        CustomImpactContainer(
          title: LocaleKeys.total_donations.tr(),
          count: totalDonationsCount,
          image: Assets.heart,
        ),
        CustomImpactContainer(
          title: LocaleKeys.Meals_Served.tr(),
          count: mealsServedCount,
          image: Assets.package,
        ),
      ],
    );
  }
}
