import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:waster/core/constants/assets.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/widgets/custom_button.dart';
import 'package:waster/features/settings/presentation/views/widgets/custom_settings_container.dart';

class AccountSettingsButtonsSection extends StatelessWidget {
  const AccountSettingsButtonsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSettingsContainer(
      title: 'Account Setting',
      children: [
        CustomButton(title: 'Save', onPressed: () {}),
        CustomButton(
          borderColor: AppColors.greyTextColor,
          backgroundColor: AppColors.scaffoldColor,
          icon: SvgPicture.asset(Assets.passwordLock),
          title: 'Change Password',
          onPressed: () {},
        ),
        CustomButton(
          borderColor: AppColors.greyTextColor,
          backgroundColor: AppColors.scaffoldColor,
          icon: SvgPicture.asset(Assets.email),
          title: 'Email Preferences',
          onPressed: () {},
        ),
        CustomButton(
          borderColor: AppColors.redColor,
          backgroundColor: AppColors.scaffoldColor,
          icon: SvgPicture.asset(
            Assets.profile,
            colorFilter: const ColorFilter.mode(
              AppColors.redColor,
              BlendMode.srcIn,
            ),
          ),
          title: 'Delete Account',
          onPressed: () {},
        ),
      ],
    );
  }
}
