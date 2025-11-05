import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/features/browse/presentation/views/widgets/custom_app_bar.dart';
import 'package:waster/features/settings/domain/entity/user_entity.dart';
import 'package:waster/features/settings/presentation/views/widgets/about_us_section.dart';
import 'package:waster/features/settings/presentation/views/widgets/account_settings_buttons_section.dart';
import 'package:waster/features/settings/presentation/views/widgets/basic_information_section.dart';
import 'package:waster/features/settings/presentation/views/widgets/business_details_section.dart';
import 'package:waster/features/settings/presentation/views/widgets/profile_editing_photo_section.dart';

class ProfileEditingView extends StatelessWidget {
  const ProfileEditingView({super.key, required this.user});
  final UserEntity user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            spacing: 24,
            children: [
              CustomAppBar(title: LocaleKeys.profile_editing.tr()),
              const ProfileEditingPhotoSection(),
              const BasicInformationSection(),
              const BusinessDetailsSection(),
              const AboutUsSection(),
              const AccountSettingsButtonsSection(),
              const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
