import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:waster/core/constants/assets.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/utils/show_toast.dart';
import 'package:waster/core/utils/validators.dart';
import 'package:waster/core/widgets/custom_button.dart';
import 'package:waster/core/widgets/custom_container.dart';
import 'package:waster/core/widgets/custom_text_feild.dart';
import 'package:waster/core/widgets/custom_drop_down_button.dart';
import 'package:waster/features/auth/data/models/roles_enum.dart';
import 'package:waster/features/auth/presentation/views/widgets/terms_and_privacy.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool isPassword = true;
  bool isConfirmPassword = true;
  bool isChecked = false;
  RolesEnum? _selectedRole;
  final _formKey = GlobalKey<FormState>();
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final locationController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    locationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      padding: 24,
      backgroundColor: AppColors.whiteColor,
      borderColor: AppColors.borderColor,
      child: Form(
        key: _formKey,
        child: Column(
          spacing: 16,
          children: [
            CustomTextFeild(
              lable: 'Full Name',
              hint: 'Enter your full name',
              controller: fullNameController,
              validator: Validators.normal,
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
              controller: emailController,
              validator: Validators.email,
              prefixIcon: SvgPicture.asset(Assets.email, width: 24),
            ),
            CustomDropDownButton<RolesEnum>(
              lable: 'I want to',
              hint: 'Select your role',
              selectedValue: _selectedRole,
              onChanged: (value) {
                setState(() {
                  _selectedRole = value;
                });
              },
              validator: (value) {
                if (value == null) {
                  return 'Please select a role';
                }
                return null;
              },
              items: const [
                DropdownMenuItem(value: RolesEnum.donor, child: Text('Donor')),
                DropdownMenuItem(
                  value: RolesEnum.recipient,
                  child: Text('Resipient'),
                ),
                DropdownMenuItem(
                  value: RolesEnum.volunteer,
                  child: Text('Volunteer'),
                ),
              ],
            ),
            CustomTextFeild(
              lable: 'Location',
              hint: 'City, State',
              controller: locationController,
              validator: Validators.normal,
              prefixIcon: SvgPicture.asset(Assets.location, width: 24),
            ),
            CustomTextFeild(
              lable: 'Password',
              hint: 'Enter your password',
              controller: passwordController,
              validator: Validators.password,
              isPassword: isPassword,
              prefixIcon: SvgPicture.asset(Assets.passwordLock, width: 24),
              suffixIcon: InkWell(
                onTap: () {
                  setState(() {
                    isPassword = !isPassword;
                  });
                },
                child: isPassword
                    ? SvgPicture.asset(Assets.passwordEye, width: 24)
                    : SvgPicture.asset(
                        Assets.passwordEyeOff,
                        colorFilter: const ColorFilter.mode(
                          AppColors.greyTextColor,
                          BlendMode.srcIn,
                        ),
                        width: 24,
                      ),
              ),
            ),
            CustomTextFeild(
              lable: 'Confirm Password',
              hint: 'Confirm your password',
              isPassword: isConfirmPassword,
              controller: confirmPasswordController,
              validator: (value) =>
                  Validators.confirmPassword(value, passwordController.text),
              prefixIcon: SvgPicture.asset(Assets.passwordLock, width: 24),
              suffixIcon: InkWell(
                onTap: () {
                  setState(() {
                    isConfirmPassword = !isConfirmPassword;
                  });
                },
                child: isConfirmPassword
                    ? SvgPicture.asset(Assets.passwordEye, width: 24)
                    : SvgPicture.asset(
                        Assets.passwordEyeOff,
                        colorFilter: const ColorFilter.mode(
                          AppColors.greyTextColor,
                          BlendMode.srcIn,
                        ),
                        width: 24,
                      ),
              ),
            ),
            TermsAndPrivacy(
              isChecked: isChecked,
              onChanged: (value) {
                setState(() {
                  isChecked = value!;
                });
              },
            ),
            CustomButton(
              title: 'Create Account',
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  if (!isChecked) {
                    showToast(context, 'pls confirm terms and privacy');
                  } else {
                    log(emailController.text);
                    log(passwordController.text);
                    log(confirmPasswordController.text);
                    log(locationController.text);
                    log(fullNameController.text);
                    log(_selectedRole.toString());
                    showToast(context, 'Account created successfully');
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
