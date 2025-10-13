import 'package:flutter/material.dart';
import 'package:waster/features/notifications/presentation/views/widgets/tab_item.dart';

class NotificationTabBarSection extends StatefulWidget {
  const NotificationTabBarSection({super.key});

  @override
  State<NotificationTabBarSection> createState() =>
      _NotificationTabBarSectionState();
}

class _NotificationTabBarSectionState extends State<NotificationTabBarSection> {
  int selectedIndex = 0;

  final List<String> tabs = ['All (5)', 'Unread (2)'];

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
