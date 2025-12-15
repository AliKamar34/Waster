import 'package:waster/features/claim/domain/entity/claim_post_entity.dart';

class ClaimPostModel extends ClaimPostEntity {
  ClaimPostModel({
    required super.id,
    required super.title,
    required super.description,
    required super.location,
    required super.status,
    required super.expiryDate,
  });

  factory ClaimPostModel.fromJson(Map<String, dynamic> json) {
    return ClaimPostModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      location: json['location'],
      status: json['status'],
      expiryDate: DateTime.parse(json['expiryDate']),
    );
  }
}
