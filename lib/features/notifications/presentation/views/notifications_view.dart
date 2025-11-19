import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waster/features/notifications/presentation/views/widgets/custom_notifications_app_bar.dart';
import 'package:waster/features/notifications/presentation/views/widgets/notification_tab_bar_section.dart';
import 'package:waster/features/notifications/presentation/views/widgets/notifications_list_view.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 16.w),
        child: const Column(
          spacing: 16,
          children: [
            CustomNotificationsAppBar(),
            NotificationTabBarSection(),
            Expanded(child: NotificationsListView()),
          ],
        ),
      ),
    );
  }
}
