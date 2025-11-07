import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:waster/core/constants/assets.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/utils/validators.dart';
import 'package:waster/core/widgets/custom_text_field.dart';

class ChangePasswordTextField extends StatelessWidget {
  const ChangePasswordTextField({
    super.key,
    required this.isPassword,
    required this.onTap,
    required TextEditingController passwordController,
    required this.lable,
    required this.hint,
  }) : _passwordController = passwordController;

  final TextEditingController _passwordController;
  final bool isPassword;
  final void Function()? onTap;
  final String lable, hint;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      lable: lable,
      hint: hint,
      controller: _passwordController,
      validator: Validators.password,
      isPassword: isPassword,
      prefixIcon: SvgPicture.asset(Assets.passwordLock, width: 24),
      suffixIcon: InkWell(
        onTap: onTap,
        child: isPassword
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
