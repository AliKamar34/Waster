import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:waster/core/constants/assets.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/utils/validators.dart';
import 'package:waster/core/widgets/custom_phone_number_feild.dart';
import 'package:waster/core/widgets/custom_text_field.dart';
import 'package:waster/features/settings/presentation/views/widgets/custom_settings_container.dart';

class BasicInformationSection extends StatelessWidget {
  const BasicInformationSection({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.phoneController,
    required this.locationController,
  });
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController locationController;
  @override
  Widget build(BuildContext context) {
    return CustomSettingsContainer(
      title: LocaleKeys.Basic_Information.tr(),
      children: [
        CustomTextField(
          hint: 'Enter Name',
          controller: nameController,
          validator: Validators.normal,
          lable: LocaleKeys.Organization_Name.tr(),
          prefixIcon: SvgPicture.asset(Assets.email),
        ),
        CustomTextField(
          hint: 'Enter Email',
          enabled: false,
          validator: Validators.email,
          controller: emailController,
          lable: LocaleKeys.Email.tr(),
          prefixIcon: SvgPicture.asset(Assets.email),
        ),
        CustomPhoneNumberFeild(controller: phoneController),
        CustomTextField(
          hint: 'Enter Location',
          controller: locationController,
          validator: Validators.normal,
          lable: LocaleKeys.Location.tr(),
          prefixIcon: SvgPicture.asset(Assets.location),
        ),
      ],
    );
  }
}
