import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:waster/core/errors/failure.dart';
import 'package:waster/features/claim/domain/entity/claim_response_entity.dart';
import 'package:waster/features/claim/domain/repo/claim_repo.dart';

class ClaimPostParams extends Equatable {
  final String postId;

  const ClaimPostParams({required this.postId});

  @override
  List<Object?> get props => [postId];
}

class ClaimPostUseCase {
  final ClaimRepo claimRepo;

  const ClaimPostUseCase({required this.claimRepo});

  Future<Either<Failure, ClaimResponseEntity>> call(
    ClaimPostParams params,
  ) async {
    return claimRepo.claimPost(postId: params.postId);
  }
}
