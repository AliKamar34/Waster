import 'package:flutter/material.dart';
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
          title: 'Meals Donated',
          color: Theme.of(context).extension<AppColors>()!.primaryColor,
        ),
        CustomCountContainer(
          count: '892 lbs',
          title: 'Pounds Saved',
          color: Theme.of(context).extension<AppColors>()!.primaryColor,
        ),
        CustomCountContainer(
          count: '23',
          title: 'Organizations Helped',
          color: Theme.of(context).extension<AppColors>()!.primaryColor,
        ),
      ],
    );
  }
}
