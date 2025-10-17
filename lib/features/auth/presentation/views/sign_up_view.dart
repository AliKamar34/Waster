import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:waster/core/constants/assets.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/routing/app_routes.dart';
import 'package:waster/core/themes/app_text_style.dart';
import 'package:waster/features/auth/presentation/views/widgets/other_auth_option_widget.dart';
import 'package:waster/features/auth/presentation/views/widgets/sign_up_form.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 24),
        child: ListView(
          children: [
            SvgPicture.asset(Assets.logo),
            const SizedBox(height: 16),
            Text(
              LocaleKeys.join.tr(),
              textAlign: TextAlign.center,
              style: AppTextStyle.styleBold24(context),
            ),
            const SizedBox(height: 16),

            Text(
              LocaleKeys.help_recipients_see_donation.tr(),
              textAlign: TextAlign.center,
              style: AppTextStyle.styleRegular14(context),
            ),
            const SizedBox(height: 16),

            const SignUpForm(),
            const SizedBox(height: 16),

            OtherAuthOptionWidget(
              title: LocaleKeys.Already_have_an_account.tr(),
              action: LocaleKeys.Sign_in.tr(),
              screen: AppRoutes.login,
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
