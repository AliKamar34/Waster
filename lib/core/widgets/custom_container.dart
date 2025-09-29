import 'package:flutter/material.dart';
import 'package:waster/core/themes/app_colors.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    required this.child,
    this.backgroundColor,
    this.padding,
    this.borderRadius,
  });
  final Widget child;
  final Color? backgroundColor;
  final double? padding;
  final double? borderRadius;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding ?? 14),
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.whiteColor,
        borderRadius: BorderRadius.circular(borderRadius ?? 12),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: child,
    );
  }
}
