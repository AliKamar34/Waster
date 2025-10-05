import 'package:flutter/material.dart';
import 'package:waster/core/constants/assets.dart';
import 'package:waster/features/browse/presentation/views/widgets/custom_filter_container.dart';

class CustomFiltersSection extends StatelessWidget {
  const CustomFiltersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      spacing: 8,
      children: [
        CustomFilterContainer(icon: Assets.filters, title: 'All'),
        CustomFilterContainer(icon: Assets.location, title: 'Near Me'),
        CustomFilterContainer(icon: Assets.timer, title: 'Urgent'),
      ],
    );
  }
}
