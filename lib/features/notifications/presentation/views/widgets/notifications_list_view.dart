import 'package:flutter/material.dart';
import 'package:waster/core/constants/assets.dart';
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
            title: 'Order Accepted!',
            description: 'Your donation of fresh vegetables has been accepte',
            time: '5 minutes ago',
            badge: 'improtant',
            badgeColor: Theme.of(context).extension<AppColors>()!.blueColor,
          ),
        );
      },
    );
  }
}
