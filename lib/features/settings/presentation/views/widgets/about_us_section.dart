import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/widgets/custom_text_feild.dart';
import 'package:waster/features/settings/presentation/views/widgets/custom_settings_container.dart';

class AboutUsSection extends StatelessWidget {
  const AboutUsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSettingsContainer(
      title: LocaleKeys.about_us.tr(),
      children: [
        CustomTextFeild(
          hint: LocaleKeys.Tell_the_community_about_your_organization.tr(),
          lable: LocaleKeys.Bio.tr(),
          maxLines: 4,
        ),
      ],
    );
  }
}
