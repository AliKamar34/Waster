import 'package:waster/features/claim/domain/entity/claim_post_entity.dart';
import 'package:waster/features/claim/domain/entity/claim_user_entity.dart';

class ClaimEntity {
  final String id;
  final String postId;
  final String status;
  final DateTime claimedAt;
  final ClaimPostEntity post;
  final ClaimUserEntity? recipient;
  final ClaimUserEntity postOwner;

  ClaimEntity({
    required this.id,
    required this.postId,
    required this.status,
    required this.claimedAt,
    required this.post,
    this.recipient,
    required this.postOwner,
  });
}
