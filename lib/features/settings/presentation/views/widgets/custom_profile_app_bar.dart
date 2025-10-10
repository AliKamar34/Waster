import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:waster/core/constants/assets.dart';
import 'package:waster/core/themes/app_text_style.dart';

class CustomProfileAppBar extends StatelessWidget {
  const CustomProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Profile', style: AppTextStyle.styleBold24(context)),
        Row(
          spacing: 16,
          children: [
            InkWell(onTap: () {}, child: SvgPicture.asset(Assets.notification)),
            InkWell(onTap: () {}, child: SvgPicture.asset(Assets.settings)),
          ],
        ),
      ],
    );
  }
}
