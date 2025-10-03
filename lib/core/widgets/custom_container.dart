import 'package:flutter/material.dart';
import 'package:waster/core/themes/app_colors.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    required this.child,
    this.backgroundColor,
    this.padding,
    this.borderRadius,
    this.borderColor,
    this.height,
    this.borderWidth,
  });
  final Widget child;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? padding;
  final double? borderRadius;
  final double? height;
  final double? borderWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: EdgeInsets.all(padding ?? 14),
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.whiteColor,
        borderRadius: BorderRadius.circular(borderRadius ?? 12),
        border: Border.all(
          width: borderWidth ?? 2,
          color: borderColor ?? AppColors.borderColor,
        ),
      ),
      child: child,
    );
  }
}
