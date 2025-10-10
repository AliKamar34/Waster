import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:waster/core/themes/app_text_style.dart';

class CustomSettingsListTile extends StatelessWidget {
  const CustomSettingsListTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.trailing,
    this.onTap,
  });
  final String title, subtitle, icon;
  final Widget trailing;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      minVerticalPadding: 0,
      visualDensity: const VisualDensity(vertical: -4),
      contentPadding: EdgeInsets.zero,
      onTap: onTap,
      leading: SvgPicture.asset(icon),
      title: Text(title, style: AppTextStyle.styleRegular18(context)),
      subtitle: Text(subtitle, style: AppTextStyle.styleRegular14(context)),
      trailing: trailing,
    );
  }
}
