import 'package:waster/features/claim/data/models/claim_post_model.dart';
import 'package:waster/features/claim/data/models/claim_user_model.dart';
import 'package:waster/features/claim/domain/entity/claim_entity.dart';

class ClaimModel extends ClaimEntity {
  ClaimModel({
    required super.id,
    required super.postId,
    required super.status,
    required super.claimedAt,
    required super.post,
    super.recipient,
    super.postOwner,
  });

  factory ClaimModel.fromJson(Map<String, dynamic> json) {
    return ClaimModel(
      id: json['id'],
      postId: json['postId'],
      status: json['status'],
      claimedAt: DateTime.parse(json['claimedAt']),
      post: ClaimPostModel.fromJson(json['post']),
      recipient: json['recipient'] != null
          ? ClaimUserModel.fromJson(json['recipient'])
          : null,
      postOwner: json['postOwner'] != null
          ? ClaimUserModel.fromJson(json['postOwner'])
          : null,
    );
  }
}
