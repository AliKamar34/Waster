import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/features/settings/presentation/views/widgets/badge_item.dart';

class ProfileBadgesList extends StatelessWidget {
  const ProfileBadgesList({super.key});

  @override
  Widget build(BuildContext context) {
    final badges = [
      LocaleKeys.Top_Donor.tr(),
      LocaleKeys.Community_Champion.tr(),
      LocaleKeys.verified.tr(),
    ];

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: badges.map((badge) {
        return BadgeItem(label: badge);
      }).toList(),
    );
  }
}
