import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:waster/core/themes/app_text_style.dart';
import 'package:waster/core/widgets/custom_container.dart';

class CustomStartWidget extends StatelessWidget {
  const CustomStartWidget({
    super.key,
    required this.color,
    required this.title,
    required this.subtitle,
    required this.icon,
  });
  final Color color;
  final String title, subtitle, icon;
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      padding: 5,
      backgroundColor: color.withValues(alpha: 0.1),
      borderColor: color,
      child: ListTile(
        contentPadding: const EdgeInsets.all(0),
        leading: CustomContainer(
          backgroundColor: color,
          child: SvgPicture.asset(icon),
        ),
        title: Text(
          title,
          style: AppTextStyle.styleRegular16(context).copyWith(color: color),
        ),
        subtitle: Text(subtitle, style: AppTextStyle.styleRegular14(context)),
      ),
    );
  }
}
