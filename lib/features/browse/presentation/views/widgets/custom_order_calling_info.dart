import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:waster/core/constants/assets.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/themes/app_text_style.dart';

class CustomOrderCallingInfoSection extends StatelessWidget {
  const CustomOrderCallingInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 4,
      children: [
        SvgPicture.asset(Assets.phone),
        Text(
          '(555) 123-4567',
          style: AppTextStyle.styleRegular14(context).copyWith(
            color: Theme.of(context).extension<AppColors>()!.blackTextColor,
          ),
        ),
        const Spacer(),
        Text(LocaleKeys.eta.tr(), style: AppTextStyle.styleRegular14(context)),
        Text(
          '2:45 ${LocaleKeys.pm.tr()}',
          style: AppTextStyle.styleRegular14(context).copyWith(
            color: Theme.of(context).extension<AppColors>()!.blackTextColor,
          ),
        ),
      ],
    );
  }
}
