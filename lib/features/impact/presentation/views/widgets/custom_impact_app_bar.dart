import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/themes/app_text_style.dart';

class CustomImpactAppBar extends StatelessWidget {
  const CustomImpactAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 4,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.your_impact.tr(),
          style: AppTextStyle.styleBold20(context),
        ),
        Text(
          LocaleKeys.see_your_impact.tr(),
          style: AppTextStyle.styleRegular14(context),
        ),
      ],
    );
  }
}
