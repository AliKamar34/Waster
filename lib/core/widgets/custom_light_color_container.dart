import 'package:flutter/material.dart';
import 'package:waster/core/widgets/custom_container.dart';

class CustomLightColorContainer extends StatelessWidget {
  const CustomLightColorContainer({
    super.key,
    required this.color,
    required this.child,
    this.padding,
  });
  final Color color;
  final Widget child;
  final double? padding;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      padding: padding,
      backgroundColor: color.withAlpha(13),
      borderColor: color.withAlpha(51),
      child: child,
    );
  }
}
