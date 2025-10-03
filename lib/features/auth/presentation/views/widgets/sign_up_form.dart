import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:waster/core/constants/assets.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/widgets/custom_button.dart';
import 'package:waster/core/widgets/custom_container.dart';
import 'package:waster/core/widgets/custom_text_feild.dart';
import 'package:waster/features/auth/presentation/views/widgets/custom_drop_down_button.dart';
import 'package:waster/features/auth/presentation/views/widgets/terms_and_privacy.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

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
              lable: 'Full Name',
              hint: 'Enter your full name',
              prefixIcon: SvgPicture.asset(
                Assets.profile,
                colorFilter: const ColorFilter.mode(
                  AppColors.greyTextColor,
                  BlendMode.srcIn,
                ),
                width: 24,
              ),
            ),
            CustomTextFeild(
              lable: 'Email',
              hint: 'Enter your email',
              prefixIcon: SvgPicture.asset(Assets.email, width: 24),
            ),
            CustomDropDownButton(
              validator: (p0) {
                return null;
              },
            ),
            CustomTextFeild(
              lable: 'Location',
              hint: 'City, State',
              prefixIcon: SvgPicture.asset(Assets.location, width: 24),
            ),
            CustomTextFeild(
              lable: 'Password',
              hint: 'Enter your password',
              isPassword: true,
              prefixIcon: SvgPicture.asset(Assets.passwordLock, width: 24),
              suffixIcon: SvgPicture.asset(Assets.passwordEye, width: 24),
            ),
            CustomTextFeild(
              lable: 'Confirm Password',
              hint: 'Confirm your password',
              isPassword: true,
              prefixIcon: SvgPicture.asset(Assets.passwordLock, width: 24),
              suffixIcon: SvgPicture.asset(Assets.passwordEye, width: 24),
            ),
            TermsAndPrivacy(isChecked: true, onChanged: (value) {}),
            CustomButton(title: 'Create Account', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
