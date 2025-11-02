import 'package:dartz/dartz.dart';
import 'package:waster/core/errors/failure.dart';
import 'package:waster/core/usecases/use_cases.dart';
import 'package:waster/features/auth/domain/entity/auth_entity.dart';
import 'package:waster/features/auth/domain/repo/auth_repo.dart';

class RefreshTokenUseCase {
  final AuthRepo authRepo;

  RefreshTokenUseCase({required this.authRepo});

  Future<Either<Failure, AuthEntity>> call(NoParams params) {
    return authRepo.refreshToken();
  }
}
