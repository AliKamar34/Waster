import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:waster/core/errors/failure.dart';
import 'package:waster/features/auth/domain/entity/auth_entity.dart';
import 'package:waster/features/auth/domain/repo/auth_repo.dart';

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}

class RefreshTokenUseCase {
  final AuthRepo authRepo;

  RefreshTokenUseCase({required this.authRepo});

  Future<Either<Failure, AuthEntity>> call(NoParams params) {
    return authRepo.refreshToken();
  }
}
