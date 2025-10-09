import 'package:flutter/material.dart';
import 'package:waster/core/themes/app_colors.dart';

class DonationProgressBar extends StatelessWidget {
  const DonationProgressBar({
    super.key,
    required this.current,
    required this.goal,
  });
  final int current, goal;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 15,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        FractionallySizedBox(
          widthFactor: current / goal >= 1 ? 1 : current / goal,
          child: Container(
            height: 15,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              gradient: LinearGradient(
                colors: [
                  AppColors.primaryColor.withAlpha(150),
                  AppColors.primaryColor,
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
