import 'package:flutter/material.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/themes/app_text_style.dart';
import 'package:waster/core/widgets/custom_button.dart';
import 'package:waster/core/widgets/custom_container.dart';

class CustomImpactInfoCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? buttonText;
  final IconData icon;
  final String imageUrl;
  final void Function()? onPressed;

  const CustomImpactInfoCard({
    super.key,
    required this.title,
    required this.subtitle,
    this.buttonText,
    this.onPressed,
    required this.icon,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;

    return CustomContainer(
      child: Row(
        spacing: 16,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              spacing: 8,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  spacing: 8,
                  children: [
                    Icon(icon, color: colors.primaryColor),
                    Text(title, style: AppTextStyle.styleBold16(context)),
                  ],
                ),
                Text(
                  subtitle,
                  style: AppTextStyle.styleRegular14(
                    context,
                  ).copyWith(color: colors.primaryColor),
                ),
                buttonText == null
                    ? const SizedBox.shrink()
                    : CustomButton(title: buttonText!, onPressed: onPressed),
              ],
            ),
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(imageUrl, height: 90, fit: BoxFit.cover),
            ),
          ),
        ],
      ),
    );
  }
}
