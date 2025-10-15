import 'package:flutter/material.dart';
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
          title: 'Total Donations',
          color: Theme.of(context).extension<AppColors>()!.primaryColor,
        ),
        CustomCountContainer(
          count: '45',
          title: 'Meals Served',
          color: Theme.of(context).extension<AppColors>()!.orangeColor,
        ),
        CustomCountContainer(
          count: '8',
          title: 'This Month',
          color: Theme.of(context).extension<AppColors>()!.blueColor,
        ),
      ],
    );
  }
}
