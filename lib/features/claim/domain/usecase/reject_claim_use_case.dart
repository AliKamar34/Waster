import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:waster/core/errors/failure.dart';
import 'package:waster/features/claim/domain/repo/claim_repo.dart';

class RejectClaimParams extends Equatable {
  final String claimId;

  const RejectClaimParams({required this.claimId});

  @override
  List<Object?> get props => [claimId];
}

class RejectClaimUseCase {
  final ClaimRepo claimRepo;

  const RejectClaimUseCase({required this.claimRepo});

  Future<Either<Failure, void>> call(RejectClaimParams params) async {
    return claimRepo.rejectClaim(claimId: params.claimId);
  }
}
