import 'package:waster/features/claim/domain/entity/claim_entity.dart';

class ClaimResponseEntity {
  final String message;
  final ClaimEntity claim;

  ClaimResponseEntity({required this.message, required this.claim});
}
