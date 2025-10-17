import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:waster/core/constants/assets.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
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
      title: LocaleKeys.notifications.tr(),
      children: [
        CustomSettingsListTile(
          icon: Assets.notification,
          title: LocaleKeys.Push_Notifications.tr(),
          subtitle: LocaleKeys.Get_notified_about_new_orders.tr(),
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
          title: LocaleKeys.SMS_Alerts.tr(),
          subtitle: LocaleKeys.Urgent_delivery_notifications.tr(),
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
          title: LocaleKeys.Email_Updates.tr(),
          subtitle: LocaleKeys.Weekly_impact_reports.tr(),
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
