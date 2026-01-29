import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:waster/features/impact/presentation/views/widgets/custom_claim_info_cards.dart';
import 'package:waster/features/impact/presentation/views/widgets/custom_impact_app_bar.dart';
import 'package:waster/features/impact/presentation/views/widgets/main_impact_grid_view.dart';
import 'package:waster/features/impact/presentation/views/widgets/monthly_goals_section.dart';

class CustomImpactLoadingWidget extends StatelessWidget {
  const CustomImpactLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Skeletonizer(
      child: Column(
        spacing: 24,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImpactAppBar(),
          CustomImpactRow(totalDonationsCount: '0', mealsServedCount: '0'),
          CustomClaimInfoCards(
            availablePosts: 0,
            totalClaims: 0,
            pendingClaims: 0,
          ),
          MonthlyGoalsSection(current: 0),
          SizedBox(height: 70),
        ],
      ),
    );
  }
}
