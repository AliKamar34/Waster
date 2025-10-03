import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:waster/core/constants/assets.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/widgets/custom_button.dart';
import 'package:waster/core/widgets/custom_container.dart';
import 'package:waster/core/widgets/custom_text_feild.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      padding: 24,
      backgroundColor: AppColors.whiteColor,
      borderColor: AppColors.borderColor,
      child: Form(
        child: Column(
          spacing: 16,
          children: [
            CustomTextFeild(
              lable: 'Email',
              hint: 'Enter your email',
              prefixIcon: SvgPicture.asset(Assets.email, width: 24),
            ),
            CustomTextFeild(
              lable: 'Password',
              hint: 'Enter your password',
              isPassword: true,
              prefixIcon: SvgPicture.asset(Assets.passwordLock, width: 24),
              suffixIcon: SvgPicture.asset(Assets.passwordEye, width: 24),
            ),
            CustomButton(title: 'Sign In', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
