import 'package:flutter/material.dart';
import 'package:waster/core/constants/assets.dart';
import 'package:waster/features/settings/presentation/views/widgets/custom_settings_container.dart';
import 'package:waster/features/settings/presentation/views/widgets/custom_settings_list_tile.dart';
import 'package:waster/features/settings/presentation/views/widgets/custom_swithcher.dart';

class NotificationsSettingsSection extends StatefulWidget {
  const NotificationsSettingsSection({super.key});

  @override
  State<NotificationsSettingsSection> createState() =>
      _NotificationsSettingsSectionState();
}

class _NotificationsSettingsSectionState
    extends State<NotificationsSettingsSection> {
  bool isPushNotification = false;
  bool isSMSNotification = false;
  bool isEmailNotification = false;
  @override
  Widget build(BuildContext context) {
    return CustomSettingsContainer(
      title: 'Notifications',
      children: [
        CustomSettingsListTile(
          icon: Assets.notification,
          title: 'Push Notifications',
          subtitle: 'Get notified about new orders',
          trailing: CustomSwithcher(
            value: isPushNotification,
            onChanged: (value) {
              setState(() {
                isPushNotification = value;
              });
            },
          ),
        ),
        const Divider(),
        CustomSettingsListTile(
          icon: Assets.phone,
          title: 'SMS Alerts',
          subtitle: 'Urgent delivery notifications',
          trailing: CustomSwithcher(
            value: isSMSNotification,
            onChanged: (value) {
              setState(() {
                isSMSNotification = value;
              });
            },
          ),
        ),
        const Divider(),
        CustomSettingsListTile(
          icon: Assets.language,
          title: 'Email Updates',
          subtitle: 'Weekly impact reports',
          trailing: CustomSwithcher(
            value: isEmailNotification,
            onChanged: (value) {
              setState(() {
                isEmailNotification = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
