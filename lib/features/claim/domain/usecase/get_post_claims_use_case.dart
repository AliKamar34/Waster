import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:waster/core/errors/failure.dart';
import 'package:waster/features/claim/domain/entity/claim_entity.dart';
import 'package:waster/features/claim/domain/repo/claim_repo.dart';

class GetPostClaimsParams extends Equatable {
  final String postId;

  const GetPostClaimsParams({required this.postId});

  @override
  List<Object?> get props => [postId];
}

class GetPostClaimsUseCase {
  final ClaimRepo claimRepo;

  const GetPostClaimsUseCase({required this.claimRepo});

  Future<Either<Failure, List<ClaimEntity>>> call(
    GetPostClaimsParams params,
  ) async {
    return claimRepo.getPostClaims(postId: params.postId);
  }
}
