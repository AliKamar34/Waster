import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:waster/core/constants/assets.dart';
import 'package:waster/core/routing/app_routes.dart';
import 'package:waster/core/themes/app_text_style.dart';
import 'package:waster/features/auth/presentation/views/widgets/log_in_form.dart';
import 'package:waster/features/auth/presentation/views/widgets/other_auth_option_widget.dart';

class LogInView extends StatelessWidget {
  const LogInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          spacing: 16,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(Assets.logo),
            Text('Welcome Back', style: AppTextStyle.styleBold24(context)),
            Text(
              'Sign in to continue helping your community',
              style: AppTextStyle.styleRegular14(context),
            ),
            const LoginForm(),
            const OtherAuthOptionWidget(
              title: 'Don’t have an account? ',
              action: 'Sign up',
              screen: AppRoutes.singUp,
            ),
          ],
        ),
      ),
    );
  }
}
