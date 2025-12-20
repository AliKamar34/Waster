import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:waster/core/errors/failure.dart';
import 'package:waster/features/claim/domain/repo/claim_repo.dart';

class CancelClaimParams extends Equatable {
  final String claimId;

  const CancelClaimParams({required this.claimId});

  @override
  List<Object?> get props => [claimId];
}

class CancelClaimUseCase {
  final ClaimRepo claimRepo;

  const CancelClaimUseCase({required this.claimRepo});

  Future<Either<Failure, void>> call(CancelClaimParams params) async {
    return claimRepo.cancelClaim(claimId: params.claimId);
  }
}
