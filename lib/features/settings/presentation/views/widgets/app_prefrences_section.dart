import 'package:flutter/material.dart';
import 'package:waster/core/constants/assets.dart';
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
  bool isDarkMode = false;
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
            value: isDarkMode,
            onChanged: (value) {
              setState(() {
                isDarkMode = value;
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
