import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/utils/validators.dart';
import 'package:waster/core/widgets/custom_text_field.dart';
import 'package:waster/features/settings/presentation/views/widgets/custom_settings_container.dart';

class AboutUsSection extends StatelessWidget {
  const AboutUsSection({super.key, required this.bioController});
  final TextEditingController bioController;
  @override
  Widget build(BuildContext context) {
    return CustomSettingsContainer(
      title: LocaleKeys.about_us.tr(),
      children: [
        CustomTextField(
          controller: bioController,
          validator: Validators.normal,
          hint: LocaleKeys.Tell_the_community_about_your_organization.tr(),
          lable: LocaleKeys.Bio.tr(),
          maxLines: 4,
        ),
      ],
    );
  }
}
