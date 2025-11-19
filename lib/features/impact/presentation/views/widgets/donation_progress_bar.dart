import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
            borderRadius: BorderRadius.circular(6.r),
          ),
        ),
        FractionallySizedBox(
          widthFactor: current / goal >= 1 ? 1 : current / goal,
          child: Container(
            height: 15,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.r),
              gradient: LinearGradient(
                colors: [
                  Theme.of(
                    context,
                  ).extension<AppColors>()!.primaryColor.withAlpha(150),
                  Theme.of(context).extension<AppColors>()!.primaryColor,
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
