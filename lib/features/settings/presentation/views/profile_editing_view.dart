import 'package:flutter/material.dart';
import 'package:waster/features/browse/presentation/views/widgets/custom_app_bar.dart';
import 'package:waster/features/settings/presentation/views/widgets/about_us_section.dart';
import 'package:waster/features/settings/presentation/views/widgets/account_settings_buttons_section.dart';
import 'package:waster/features/settings/presentation/views/widgets/basic_information_section.dart';
import 'package:waster/features/settings/presentation/views/widgets/business_details_section.dart';
import 'package:waster/features/settings/presentation/views/widgets/profile_editing_photo_section.dart';

class ProfileEditingView extends StatelessWidget {
  const ProfileEditingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            spacing: 24,
            children: [
              CustomAppBar(title: 'Profile Editing'),
              ProfileEditingPhotoSection(),
              BasicInformationSection(),
              BusinessDetailsSection(),
              AboutUsSection(),
              AccountSettingsButtonsSection(),
              SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
