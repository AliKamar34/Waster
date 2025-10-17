import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:waster/core/constants/assets.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/widgets/custom_button.dart';
import 'package:waster/features/settings/presentation/views/widgets/custom_settings_container.dart';

class AccountSettingsButtonsSection extends StatelessWidget {
  const AccountSettingsButtonsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSettingsContainer(
      title: LocaleKeys.account_settings.tr(),
      children: [
        CustomButton(title: LocaleKeys.save.tr(), onPressed: () {}),
        CustomButton(
          borderColor: Theme.of(context).extension<AppColors>()!.greyTextColor,
          backgroundColor: Theme.of(
            context,
          ).extension<AppColors>()!.scaffoldColor,
          icon: SvgPicture.asset(Assets.passwordLock),
          title: LocaleKeys.change_password.tr(),
          onPressed: () {},
        ),
        CustomButton(
          borderColor: Theme.of(context).extension<AppColors>()!.greyTextColor,
          backgroundColor: Theme.of(
            context,
          ).extension<AppColors>()!.scaffoldColor,
          icon: SvgPicture.asset(Assets.email),
          title: LocaleKeys.Email_Preferences.tr(),
          onPressed: () {},
        ),
        CustomButton(
          borderColor: Theme.of(context).extension<AppColors>()!.redColor,
          backgroundColor: Theme.of(
            context,
          ).extension<AppColors>()!.scaffoldColor,
          icon: SvgPicture.asset(
            Assets.profile,
            colorFilter: ColorFilter.mode(
              Theme.of(context).extension<AppColors>()!.redColor,
              BlendMode.srcIn,
            ),
          ),
          title: LocaleKeys.Delete_Account.tr(),
          onPressed: () {},
        ),
      ],
    );
  }
}
