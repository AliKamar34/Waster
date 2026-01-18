import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:waster/core/constants/assets.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/utils/validators.dart';
import 'package:waster/core/widgets/custom_text_field.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    super.key,
    required this.isPassword,
    required this.onTap,
    required TextEditingController passwordController,
  }) : _passwordController = passwordController;

  final TextEditingController _passwordController;
  final bool isPassword;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      keyboardType: TextInputType.visiblePassword,
      lable: LocaleKeys.Password.tr(),
      hint: LocaleKeys.Enter_your_password.tr(),
      controller: _passwordController,
      validator: Validators.password,
      isPassword: isPassword,
      prefixIcon: SvgPicture.asset(Assets.passwordLock, width: 24.sp),
      suffixIcon: InkWell(
        onTap: onTap,
        child: isPassword
            ? SvgPicture.asset(Assets.passwordEye, width: 24.sp)
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
