import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:waster/core/constants/assets.dart';
import 'package:waster/core/widgets/custom_text_feild.dart';
import 'package:waster/features/settings/presentation/views/widgets/custom_settings_container.dart';

class BusinessDetailsSection extends StatelessWidget {
  const BusinessDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSettingsContainer(
      title: 'Business Details',
      children: [
        CustomTextFeild(
          hint: 'www.example.com',
          lable: 'Website',
          prefixIcon: SvgPicture.asset(Assets.language),
        ),
        CustomTextFeild(
          hint: 'Mon-Fri: 8AM-8PM, Sat-Sun: 9AM-6PM',
          lable: 'Business Hours',
          prefixIcon: SvgPicture.asset(Assets.timer),
        ),
      ],
    );
  }
}
