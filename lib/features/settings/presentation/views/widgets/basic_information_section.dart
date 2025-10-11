import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:waster/core/constants/assets.dart';
import 'package:waster/core/widgets/custom_text_feild.dart';
import 'package:waster/features/settings/presentation/views/widgets/custom_settings_container.dart';

class BasicInformationSection extends StatelessWidget {
  const BasicInformationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSettingsContainer(
      title: 'Basic Information',
      children: [
        CustomTextFeild(
          hint: 'Green Grocers',
          lable: 'Organization Name',
          prefixIcon: SvgPicture.asset(Assets.email),
        ),
        CustomTextFeild(
          hint: 'donor@example.com',
          lable: 'Email',
          prefixIcon: SvgPicture.asset(Assets.email),
        ),
        CustomTextFeild(
          hint: '+1 (555) 123-4567',
          lable: 'Phone Number',
          prefixIcon: SvgPicture.asset(Assets.phone),
        ),
        CustomTextFeild(
          hint: 'San Francisco, CA',
          lable: 'Location',
          prefixIcon: SvgPicture.asset(Assets.location),
        ),
      ],
    );
  }
}
