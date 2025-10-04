import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:waster/core/constants/assets.dart';
import 'package:waster/core/routing/app_routes.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/utils/validators.dart';
import 'package:waster/core/widgets/custom_button.dart';
import 'package:waster/core/widgets/custom_container.dart';
import 'package:waster/core/widgets/custom_text_feild.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool isPassword = true;
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
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
              lable: 'Email',
              hint: 'Enter your email',
              controller: emailController,
              prefixIcon: SvgPicture.asset(Assets.email, width: 24),
              validator: Validators.email,
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
            CustomButton(
              title: 'Sign In',
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  context.pushReplacementNamed(AppRoutes.mainView);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
