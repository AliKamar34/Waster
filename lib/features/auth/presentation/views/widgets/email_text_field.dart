import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:waster/core/constants/assets.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/utils/validators.dart';
import 'package:waster/core/widgets/custom_text_field.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({
    super.key,
    required TextEditingController emailController,
  }) : _emailController = emailController;

  final TextEditingController _emailController;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      keyboardType: TextInputType.emailAddress,
      lable: LocaleKeys.Email.tr(),
      hint: LocaleKeys.Enter_your_email.tr(),
      controller: _emailController,
      validator: Validators.email,
      prefixIcon: SvgPicture.asset(Assets.email, width: 24.sp),
    );
  }
}
