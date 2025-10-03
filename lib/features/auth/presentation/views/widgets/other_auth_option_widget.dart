import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/themes/app_text_style.dart';

class OtherAuthOptionWidget extends StatelessWidget {
  const OtherAuthOptionWidget({
    super.key,
    required this.title,
    required this.action,
    required this.screen,
  });
  final String title, action, screen;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: RichText(
        text: TextSpan(
          text: title,
          style: AppTextStyle.styleRegular16(
            context,
          ).copyWith(color: AppColors.blackTextColor),
          children: [
            TextSpan(
              recognizer: TapGestureRecognizer()
                ..onTap = () => context.pushReplacementNamed(screen),
              text: action,
              style: AppTextStyle.styleBold16(
                context,
              ).copyWith(color: AppColors.primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
