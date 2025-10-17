import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/features/impact/presentation/views/widgets/metric_item.dart';

class ImpactMetricsRow extends StatelessWidget {
  const ImpactMetricsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: MetricItem(
            value: '89 ${LocaleKeys.kg.tr()}',
            title: LocaleKeys.co_saved.tr(),
          ),
        ),
        Expanded(
          child: MetricItem(
            value: '342 ${LocaleKeys.lbs.tr()}',
            title: LocaleKeys.Waste_Diverted.tr(),
          ),
        ),
        Expanded(
          child: MetricItem(value: '156', title: LocaleKeys.Lives_Fed.tr()),
        ),
      ],
    );
  }
}
