import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:waster/core/constants/assets.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/features/browse/presentation/views/widgets/custom_filter_container.dart';

class CustomFiltersSection extends StatelessWidget {
  const CustomFiltersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        CustomFilterContainer(icon: Assets.filters, title: LocaleKeys.all.tr()),
        CustomFilterContainer(
          icon: Assets.location,
          title: LocaleKeys.near_me.tr(),
        ),
        CustomFilterContainer(
          icon: Assets.timer,
          title: LocaleKeys.Urgent.tr(),
        ),
      ],
    );
  }
}
