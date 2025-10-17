import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/themes/app_text_style.dart';
import 'package:waster/features/impact/presentation/views/widgets/achievement_grid_view.dart';

class AchievementBadgesSection extends StatelessWidget {
  const AchievementBadgesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.achievement_badges.tr(),
          style: AppTextStyle.styleRegular18(context),
        ),
        const AchievementGridView(),
      ],
    );
  }
}
