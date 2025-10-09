import 'package:flutter/material.dart';
import 'package:waster/core/themes/app_text_style.dart';
import 'package:waster/core/widgets/custom_container.dart';
import 'package:waster/features/impact/presentation/views/widgets/leaderboard_item.dart';

class CommunityLeaderboardSection extends StatelessWidget {
  const CommunityLeaderboardSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Community Leaderboard',
          style: AppTextStyle.styleRegular18(context),
        ),
        const CustomContainer(
          child: Column(
            spacing: 8,
            children: [
              LeaderboardItem(rank: 1, name: 'Green Grocers', donations: 45),
              LeaderboardItem(rank: 2, name: 'Corner Bakery', donations: 30),
              LeaderboardItem(rank: 3, name: 'You', donations: 22),
            ],
          ),
        ),
      ],
    );
  }
}
