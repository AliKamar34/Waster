import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/features/browse/presentation/views/widgets/custom_app_bar.dart';
import 'package:waster/features/settings/presentation/views/widgets/account_settings_section.dart';
import 'package:waster/features/settings/presentation/views/widgets/app_prefrences_section.dart';
import 'package:waster/features/settings/presentation/views/widgets/custom_log_out_container.dart';
import 'package:waster/features/settings/presentation/views/widgets/notifications_settings_section.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            spacing: 16,
            children: [
              CustomAppBar(title: LocaleKeys.settings.tr()),
              const AccountSettingsSection(),
              const NotificationsSettingsSection(),
              const AppPrefrencesSection(),
              const CustomLogOutContainer(),
              const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
