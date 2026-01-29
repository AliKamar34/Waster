import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:waster/core/constants/assets.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/routing/app_routes.dart';
import 'package:waster/features/impact/presentation/views/widgets/impact_info_card.dart';

class CustomClaimInfoCards extends StatelessWidget {
  const CustomClaimInfoCards({
    super.key,
    required this.availablePosts,
    required this.totalClaims,
    required this.pendingClaims,
  });
  final int availablePosts, totalClaims, pendingClaims;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      children: [
        CustomImpactInfoCard(
          title: LocaleKeys.available_posts.tr(),
          subtitle: '$availablePosts  ${LocaleKeys.available_food.tr()}',
          icon: Icons.list_alt,
          imageUrl: Assets.availablePosts,
          buttonText: LocaleKeys.My_Orders.tr(),
          onPressed: () {
            context.pushNamed(AppRoutes.myPostsView);
          },
        ),
        CustomImpactInfoCard(
          title: LocaleKeys.total_claims.tr(),
          subtitle: '$totalClaims  ${LocaleKeys.total_claims.tr()}',
          icon: Icons.check_circle_outline_rounded,
          imageUrl: Assets.food,
        ),
        CustomImpactInfoCard(
          title: LocaleKeys.pending_claims.tr(),
          subtitle: '$pendingClaims  ${LocaleKeys.pending_claims.tr()}',
          icon: Icons.pending_actions_outlined,
          imageUrl: Assets.pendingClaims,
          buttonText: LocaleKeys.claimedPosts.tr(),
          onPressed: () {
            context.pushNamed(AppRoutes.claimView);
          },
        ),
      ],
    );
  }
}
