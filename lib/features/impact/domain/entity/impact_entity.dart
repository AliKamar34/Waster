class ImpactEntity {
  final int totalDonations;
  final int mealsServedInKG;
  final int availablePosts;
  final int totalClaims;
  final int pendingClaims;
  final int monthlyGoals;

  const ImpactEntity({
    required this.totalDonations,
    required this.mealsServedInKG,
    required this.availablePosts,
    required this.totalClaims,
    required this.pendingClaims,
    required this.monthlyGoals,
  });
}
