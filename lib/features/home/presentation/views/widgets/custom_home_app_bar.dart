import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:waster/core/constants/assets.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/themes/app_text_style.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text('Welcome back!', style: AppTextStyle.styleBold24(context)),
      subtitle: Text(
        'Ready to make a difference today?',
        style: AppTextStyle.styleRegular16(
          context,
        ).copyWith(color: AppColors.greyTextColor),
      ),
      trailing: SvgPicture.asset(Assets.notification),
    );
  }
}
