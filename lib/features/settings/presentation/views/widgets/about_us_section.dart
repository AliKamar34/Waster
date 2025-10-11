import 'package:flutter/material.dart';
import 'package:waster/core/widgets/custom_text_feild.dart';
import 'package:waster/features/settings/presentation/views/widgets/custom_settings_container.dart';

class AboutUsSection extends StatelessWidget {
  const AboutUsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomSettingsContainer(
      title: 'About Us',
      children: [
        CustomTextFeild(
          hint: 'Tell the community about your organization...',
          lable: 'Bio',
          maxLines: 4,
        ),
      ],
    );
  }
}
