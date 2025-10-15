import 'package:flutter/material.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/widgets/custom_count_container.dart';

class BrowseCountSection extends StatelessWidget {
  const BrowseCountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        CustomCountContainer(
          count: '8',
          title: 'Available',
          color: Theme.of(context).extension<AppColors>()!.orangeColor,
        ),
        CustomCountContainer(
          count: '3',
          title: 'Reserved',
          color: Theme.of(context).extension<AppColors>()!.primaryColor,
        ),
        CustomCountContainer(
          count: '12',
          title: 'This Week',
          color: Theme.of(context).extension<AppColors>()!.blueColor,
        ),
      ],
    );
  }
}
