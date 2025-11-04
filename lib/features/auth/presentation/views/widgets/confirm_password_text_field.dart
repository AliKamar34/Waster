import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:waster/core/constants/assets.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/utils/validators.dart';
import 'package:waster/core/widgets/custom_text_field.dart';

class ConfirmPasswordTextField extends StatelessWidget {
  const ConfirmPasswordTextField({
    super.key,
    required this.isConfirmPassword,
    required this.onTap,
    required TextEditingController confirmPasswordController,
    required TextEditingController passwordController,
  }) : _confirmPasswordController = confirmPasswordController,
       _passwordController = passwordController;

  final TextEditingController _confirmPasswordController;
  final TextEditingController _passwordController;
  final bool isConfirmPassword;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      lable: LocaleKeys.Confirm_Password.tr(),
      hint: LocaleKeys.Confirm_your_password.tr(),
      isPassword: isConfirmPassword,
      controller: _confirmPasswordController,
      validator: (value) =>
          Validators.confirmPassword(value, _passwordController.text),
      prefixIcon: SvgPicture.asset(Assets.passwordLock, width: 24),
      suffixIcon: InkWell(
        onTap: onTap,
        child: isConfirmPassword
            ? SvgPicture.asset(Assets.passwordEye, width: 24)
            : SvgPicture.asset(
                Assets.passwordEyeOff,
                colorFilter: ColorFilter.mode(
                  Theme.of(context).extension<AppColors>()!.greyTextColor,
                  BlendMode.srcIn,
                ),
                width: 24,
              ),
      ),
    );
  }
}
