import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:waster/core/constants/assets.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/widgets/custom_text_field.dart';
import 'package:waster/features/settings/presentation/views/widgets/custom_settings_container.dart';

class BusinessDetailsSection extends StatelessWidget {
  const BusinessDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSettingsContainer(
      title: LocaleKeys.Business_Details.tr(),
      children: [
        CustomTextField(
          keyboardType: TextInputType.text,
          hint: 'www.example.com',
          lable: LocaleKeys.Website.tr(),
          prefixIcon: SvgPicture.asset(Assets.language),
        ),
        CustomTextField(
          keyboardType: TextInputType.text,
          hint: 'Mon-Fri: 8AM-8PM, Sat-Sun: 9AM-6PM',
          lable: LocaleKeys.Business_Hours.tr(),
          prefixIcon: SvgPicture.asset(Assets.timer),
        ),
      ],
    );
  }
}
