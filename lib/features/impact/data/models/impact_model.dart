import 'package:waster/features/impact/domain/entity/impact_entity.dart';

class ImpactModel extends ImpactEntity {
  ImpactModel({
    required super.totalDonations,
    required super.mealsServedInKG,
    required super.availablePosts,
    required super.totalClaims,
    required super.pendingClaims,
    required super.monthlyGoals,
  });

  factory ImpactModel.fromJson(Map<String, dynamic> json) {
    return ImpactModel(
      totalDonations: json['totalDonations'] ?? 0,
      mealsServedInKG: json['mealsServedInKG'] ?? 0,
      availablePosts: json['availablePosts'] ?? 0,
      totalClaims: json['totalClaims'] ?? 0,
      pendingClaims: json['pendingClaims'] ?? 0,
      monthlyGoals: json['monthlygoals'] ?? 0,
    );
  }
}
