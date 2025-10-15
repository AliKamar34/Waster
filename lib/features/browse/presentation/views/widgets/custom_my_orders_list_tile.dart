import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/themes/app_text_style.dart';

class CustomMyOrdersListTile extends StatelessWidget {
  const CustomMyOrdersListTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.iconColor,
  });
  final String title, subtitle, icon;
  final Color iconColor;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: SvgPicture.asset(
        icon,
        colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
      ),
      title: Text(
        title,
        style: AppTextStyle.styleRegular16(context).copyWith(
          color: Theme.of(context).extension<AppColors>()!.greyTextColor,
        ),
      ),
      subtitle: Text(subtitle, style: AppTextStyle.styleRegular16(context)),
    );
  }
}
