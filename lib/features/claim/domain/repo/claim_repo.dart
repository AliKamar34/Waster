import 'package:dartz/dartz.dart';
import 'package:waster/core/errors/failure.dart';
import 'package:waster/features/claim/domain/entity/claim_entity.dart';
import 'package:waster/features/claim/domain/entity/claim_response_entity.dart';

abstract class ClaimRepo {
  Future<Either<Failure, List<ClaimEntity>>> getUserClaims(String status);
  Future<Either<Failure, ClaimResponseEntity>> claimPost({
    required String postId,
  });
  Future<Either<Failure, List<ClaimEntity>>> getPostClaims({
    required String postId,
  });
  Future<Either<Failure, void>> approveClaim({required String claimId});
  Future<Either<Failure, void>> rejectClaim({required String claimId});
  Future<Either<Failure, void>> cancelClaim({required String claimId});
}
