import 'package:flutter/material.dart';
import 'package:waster/core/themes/app_text_style.dart';
import 'package:waster/core/widgets/custom_container.dart';

class CustomTabBarButton extends StatelessWidget {
  const CustomTabBarButton({
    super.key,
    required this.title,
    required this.color,
    this.onPressed,
    required this.textColor,
  });
  final String title;
  final Color color;
  final Color textColor;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(end: 10),
      child: GestureDetector(
        onTap: onPressed,
        child: CustomContainer(
          padding: 6,
          backgroundColor: color,
          borderWidth: 2,
          child: Text(
            title,
            style: AppTextStyle.styleRegular16(
              context,
            ).copyWith(color: textColor),
          ),
        ),
      ),
    );
  }
}
