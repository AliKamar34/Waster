import 'package:dartz/dartz.dart';
import 'package:waster/core/data/base_repository.dart';
import 'package:waster/core/errors/failure.dart';
import 'package:waster/features/claim/data/datasource/claim_remote_data_source.dart';
import 'package:waster/features/claim/domain/entity/claim_entity.dart';
import 'package:waster/features/claim/domain/entity/claim_response_entity.dart';
import 'package:waster/features/claim/domain/repo/claim_repo.dart';

class ClaimRepoImpl extends BaseRepository implements ClaimRepo {
  final ClaimRemoteDataSource claimRemoteDataSource;

  ClaimRepoImpl({required this.claimRemoteDataSource});

  @override
  Future<Either<Failure, ClaimResponseEntity>> claimPost({
    required String postId,
  }) {
    return execute(() => claimRemoteDataSource.claimPost(postId: postId));
  }

  @override
  Future<Either<Failure, List<ClaimEntity>>> getUserClaims(String status) {
    return execute(() => claimRemoteDataSource.getUserClaims(status));
  }

  @override
  Future<Either<Failure, void>> aproveClaim({required String claimId}) {
    return execute(() => claimRemoteDataSource.aproveClaim(claimId: claimId));
  }

  @override
  Future<Either<Failure, void>> cancelClaim({required String claimId}) {
    return execute(() => claimRemoteDataSource.cancelClaim(claimId: claimId));
  }

  @override
  Future<Either<Failure, List<ClaimEntity>>> getPostClaims({
    required String postId,
  }) {
    return execute(() => claimRemoteDataSource.getPostClaims(postId: postId));
  }

  @override
  Future<Either<Failure, void>> rejectClaim({required String claimId}) {
    return execute(() => claimRemoteDataSource.rejectClaim(claimId: claimId));
  }
}
