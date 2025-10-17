import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:waster/core/constants/assets.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/features/notifications/presentation/views/widgets/notification_container.dart';

class NotificationsListView extends StatelessWidget {
  const NotificationsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsetsDirectional.only(bottom: 16),
          child: NotificationContainer(
            isRead: true,
            icon: Assets.package,
            title: LocaleKeys.order_accepted.tr(),
            description: 'Your donation of fresh vegetables has been accepte',
            time: '5 ${LocaleKeys.minutes_ago.tr()}',
            badge: LocaleKeys.important.tr(),
            badgeColor: Theme.of(context).extension<AppColors>()!.blueColor,
          ),
        );
      },
    );
  }
}
