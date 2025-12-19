import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:waster/core/errors/failure.dart';
import 'package:waster/features/claim/domain/repo/claim_repo.dart';

class CancleClaimParams extends Equatable {
  final String claimId;

  const CancleClaimParams({required this.claimId});

  @override
  List<Object?> get props => [claimId];
}

class CancleClaimUseCase {
  final ClaimRepo claimRepo;

  const CancleClaimUseCase({required this.claimRepo});

  Future<Either<Failure, void>> call(CancleClaimParams params) async {
    return claimRepo.cancelClaim(claimId: params.claimId);
  }
}
