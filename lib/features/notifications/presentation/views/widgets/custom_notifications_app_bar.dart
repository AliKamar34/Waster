import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:waster/core/constants/assets.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/themes/app_text_style.dart';

class CustomNotificationsAppBar extends StatelessWidget {
  const CustomNotificationsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
        ),
        Center(
          child: Text(
            LocaleKeys.notifications.tr(),
            style: AppTextStyle.styleBold20(context),
          ),
        ),
        InkWell(onTap: () {}, child: SvgPicture.asset(Assets.delivered)),
      ],
    );
  }
}
