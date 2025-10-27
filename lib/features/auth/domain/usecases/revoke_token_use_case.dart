import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:waster/core/errors/failure.dart';
import 'package:waster/features/auth/domain/repo/auth_repo.dart';

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}

class RevokeTokenUseCase {
  final AuthRepo authRepo;

  RevokeTokenUseCase({required this.authRepo});

  Future<Either<Failure, void>> call(NoParams params) {
    return authRepo.revokeToken();
  }
}
