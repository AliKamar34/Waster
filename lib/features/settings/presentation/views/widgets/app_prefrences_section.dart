import 'package:flutter/material.dart';
import 'package:waster/core/constants/assets.dart';
import 'package:waster/core/themes/theme_controller.dart';
import 'package:waster/features/settings/presentation/views/widgets/custom_settings_container.dart';
import 'package:waster/features/settings/presentation/views/widgets/custom_settings_list_tile.dart';
import 'package:waster/features/settings/presentation/views/widgets/custom_swithcher.dart';

class AppPrefrencesSection extends StatefulWidget {
  const AppPrefrencesSection({super.key});

  @override
  State<AppPrefrencesSection> createState() => _AppPrefrencesSectionState();
}

class _AppPrefrencesSectionState extends State<AppPrefrencesSection> {
  bool isEnglish = false;
  @override
  Widget build(BuildContext context) {
    return CustomSettingsContainer(
      title: 'App Preferences',
      children: [
        CustomSettingsListTile(
          icon: Assets.darkMode,
          title: 'Dark Mode',
          subtitle: 'Switch to dark theme',
          trailing: CustomSwithcher(
            value: ThemeController.instance.isDark,
            onChanged: (value) {
              setState(() {
                ThemeController.instance.setDark(
                  !ThemeController.instance.isDark,
                );
              });
            },
          ),
        ),
        const Divider(),
        CustomSettingsListTile(
          icon: Assets.language,
          title: 'Language',
          subtitle: 'English',
          trailing: CustomSwithcher(
            value: isEnglish,
            onChanged: (value) {
              setState(() {
                isEnglish = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
