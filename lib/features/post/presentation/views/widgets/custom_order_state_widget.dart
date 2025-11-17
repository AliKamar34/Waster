import 'package:flutter/material.dart';
import 'package:waster/core/themes/app_text_style.dart';
import 'package:waster/core/widgets/custom_container.dart';

class CustomOrderStateWidget extends StatelessWidget {
  const CustomOrderStateWidget({
    super.key,
    required this.color,
    required this.state,
  });
  final Color color;
  final String state;
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      padding: 4,
      borderWidth: 1.5,
      borderRadius: 8,
      borderColor: color.withAlpha(52),
      backgroundColor: color.withAlpha(26),
      child: Text(
        state,
        style: AppTextStyle.styleRegular14(context).copyWith(color: color),
      ),
    );
  }
}
