import 'package:flutter/material.dart';
import 'package:waster/features/browse/presentation/views/widgets/custom_app_bar.dart';
import 'package:waster/features/settings/presentation/views/widgets/account_settings_section.dart';
import 'package:waster/features/settings/presentation/views/widgets/app_prefrences_section.dart';
import 'package:waster/features/settings/presentation/views/widgets/custom_log_out_container.dart';
import 'package:waster/features/settings/presentation/views/widgets/notifications_settings_section.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            spacing: 16,
            children: [
              CustomAppBar(title: 'Settings'),
              AccountSettingsSection(),
              NotificationsSettingsSection(),
              AppPrefrencesSection(),
              CustomLogOutContainer(),
              SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
