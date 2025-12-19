import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:waster/core/errors/failure.dart';
import 'package:waster/features/claim/domain/repo/claim_repo.dart';

class AproveClaimParams extends Equatable {
  final String claimId;

  const AproveClaimParams({required this.claimId});

  @override
  List<Object?> get props => [claimId];
}

class AproveClaimUseCase {
  final ClaimRepo claimRepo;

  const AproveClaimUseCase({required this.claimRepo});

  Future<Either<Failure, void>> call(AproveClaimParams params) async {
    return claimRepo.aproveClaim(claimId: params.claimId);
  }
}
