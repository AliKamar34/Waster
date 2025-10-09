import 'package:flutter/material.dart';
import 'package:waster/features/impact/presentation/views/widgets/achievement_badges_section.dart';
import 'package:waster/features/impact/presentation/views/widgets/community_leaderboard_section.dart';
import 'package:waster/features/impact/presentation/views/widgets/custom_impact_app_bar.dart';
import 'package:waster/features/impact/presentation/views/widgets/environmental_impact_section.dart';
import 'package:waster/features/impact/presentation/views/widgets/main_impact_grid_view.dart';
import 'package:waster/features/impact/presentation/views/widgets/monthly_goals_section.dart';

class ImpactView extends StatelessWidget {
  const ImpactView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            spacing: 24,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomImpactAppBar(),
              MainImpactGridView(),
              AchievementBadgesSection(),
              MonthlyGoalsSection(),
              EnvironmentalImpactSection(),
              CommunityLeaderboardSection(),
            ],
          ),
        ),
      ),
    );
  }
}
