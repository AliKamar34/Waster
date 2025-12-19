import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:waster/core/errors/failure.dart';
import 'package:waster/features/claim/domain/entity/claim_entity.dart';
import 'package:waster/features/claim/domain/repo/claim_repo.dart';

class GetUserClaimsParams extends Equatable {
  final String status;

  const GetUserClaimsParams({required this.status});

  @override
  List<Object?> get props => [status];
}

class GetUserClaimsUseCase {
  final ClaimRepo claimRepo;

  const GetUserClaimsUseCase({required this.claimRepo});

  Future<Either<Failure, List<ClaimEntity>>> call(
    GetUserClaimsParams params,
  ) async {
    return claimRepo.getUserClaims(params.status);
  }
}
