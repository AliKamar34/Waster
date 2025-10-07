import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:waster/core/constants/assets.dart';
import 'package:waster/core/themes/app_text_style.dart';

class ScheduleListTile extends StatelessWidget {
  const ScheduleListTile({super.key, required this.title, required this.time});
  final String title, time;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      minVerticalPadding: 0,
      visualDensity: const VisualDensity(vertical: -4),
      contentPadding: EdgeInsets.zero,
      leading: SvgPicture.asset(Assets.timer),
      title: Text(title, style: AppTextStyle.styleRegular16(context)),
      subtitle: Text(time, style: AppTextStyle.styleRegular14(context)),
    );
  }
}
