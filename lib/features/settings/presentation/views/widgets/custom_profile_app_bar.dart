import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:waster/core/constants/assets.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/routing/app_routes.dart';
import 'package:waster/core/themes/app_text_style.dart';

class CustomProfileAppBar extends StatelessWidget {
  const CustomProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(LocaleKeys.profile.tr(), style: AppTextStyle.styleBold24(context)),
        Row(
          spacing: 16,
          children: [
            InkWell(
              onTap: () {
                context.pushNamed(AppRoutes.notificationsView);
              },
              child: SvgPicture.asset(Assets.notification),
            ),
            InkWell(
              onTap: () {
                context.pushNamed(AppRoutes.settingsView);
              },
              child: SvgPicture.asset(Assets.settings),
            ),
          ],
        ),
      ],
    );
  }
}
