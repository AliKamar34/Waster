import 'package:flutter/material.dart';
import 'package:waster/features/settings/presentation/views/widgets/badge_item.dart';

class ProfileBadgesList extends StatelessWidget {
  const ProfileBadgesList({super.key});

  @override
  Widget build(BuildContext context) {
    final badges = ['Top Donor', 'Community Hero', 'Verified'];

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: badges.map((badge) {
        return BadgeItem(label: badge);
      }).toList(),
    );
  }
}
