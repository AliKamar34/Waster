import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:waster/core/constants/assets.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/widgets/custom_text_field.dart';
import 'package:waster/features/settings/presentation/views/widgets/custom_settings_container.dart';

class BasicInformationSection extends StatelessWidget {
  const BasicInformationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSettingsContainer(
      title: LocaleKeys.Basic_Information.tr(),
      children: [
        CustomTextField(
          hint: 'Green Grocers',
          lable: LocaleKeys.Organization_Name.tr(),
          prefixIcon: SvgPicture.asset(Assets.email),
        ),
        CustomTextField(
          hint: 'donor@example.com',
          lable: LocaleKeys.Email.tr(),
          prefixIcon: SvgPicture.asset(Assets.email),
        ),
        CustomTextField(
          hint: '+1 (555) 123-4567',
          lable: LocaleKeys.phone_number.tr(),
          prefixIcon: SvgPicture.asset(Assets.phone),
        ),
        CustomTextField(
          hint: 'San Francisco, CA',
          lable: LocaleKeys.Location.tr(),
          prefixIcon: SvgPicture.asset(Assets.location),
        ),
      ],
    );
  }
}
