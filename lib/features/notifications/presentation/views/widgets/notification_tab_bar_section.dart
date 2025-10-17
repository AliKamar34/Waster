import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/features/notifications/presentation/views/widgets/tab_item.dart';

class NotificationTabBarSection extends StatefulWidget {
  const NotificationTabBarSection({super.key});

  @override
  State<NotificationTabBarSection> createState() =>
      _NotificationTabBarSectionState();
}

class _NotificationTabBarSectionState extends State<NotificationTabBarSection> {
  int selectedIndex = 0;

  final List<String> tabs = [
    '${LocaleKeys.all.tr()} (5)',
    '${LocaleKeys.un_read.tr()} (2)',
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: List.generate(
        tabs.length,
        (index) => Expanded(
          child: TabItem(
            label: tabs[index],
            isSelected: selectedIndex == index,
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
