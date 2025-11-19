import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:waster/core/constants/assets.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/routing/app_routes.dart';
import 'package:waster/core/themes/app_text_style.dart';
import 'package:waster/features/auth/presentation/views/widgets/log_in_form.dart';
import 'package:waster/features/auth/presentation/views/widgets/other_auth_option_widget.dart';

class LogInViewBody extends StatelessWidget {
  const LogInViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.symmetric(horizontal: 24.w),
      child: SingleChildScrollView(
        child: Column(
          spacing: 16,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 120.h),
            SvgPicture.asset(Assets.logo),
            Text(
              LocaleKeys.welcome_back.tr(),
              style: AppTextStyle.styleBold24(context),
            ),
            Text(
              LocaleKeys.sign_in_message.tr(),
              style: AppTextStyle.styleRegular14(context),
            ),
            const LoginForm(),
            OtherAuthOptionWidget(
              title: LocaleKeys.Dont_have_an_account.tr(),
              action: LocaleKeys.sign_up.tr(),
              screen: AppRoutes.singUp,
            ),
            SizedBox(height: 120.h),
          ],
        ),
      ),
    );
  }
}
