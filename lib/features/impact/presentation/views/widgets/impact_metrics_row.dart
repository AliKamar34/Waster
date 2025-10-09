import 'package:flutter/material.dart';
import 'package:waster/features/impact/presentation/views/widgets/metric_item.dart';

class ImpactMetricsRow extends StatelessWidget {
  const ImpactMetricsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MetricItem(value: '89 kg', title: 'CO₂ Saved'),
        MetricItem(value: '342 lbs', title: 'Waste Diverted'),
        MetricItem(value: '156', title: 'Lives Fed'),
      ],
    );
  }
}
