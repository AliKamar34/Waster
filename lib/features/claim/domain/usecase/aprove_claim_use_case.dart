import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:waster/core/errors/failure.dart';
import 'package:waster/features/claim/domain/repo/claim_repo.dart';

class ApproveClaimParams extends Equatable {
  final String claimId;

  const ApproveClaimParams({required this.claimId});

  @override
  List<Object?> get props => [claimId];
}

class ApproveClaimUseCase {
  final ClaimRepo claimRepo;

  const ApproveClaimUseCase({required this.claimRepo});

  Future<Either<Failure, void>> call(ApproveClaimParams params) async {
    return claimRepo.approveClaim(claimId: params.claimId);
  }
}
