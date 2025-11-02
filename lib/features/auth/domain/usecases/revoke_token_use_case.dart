import 'package:dartz/dartz.dart';
import 'package:waster/core/errors/failure.dart';
import 'package:waster/core/usecases/use_cases.dart';
import 'package:waster/features/auth/domain/repo/auth_repo.dart';

class RevokeTokenUseCase {
  final AuthRepo authRepo;

  RevokeTokenUseCase({required this.authRepo});

  Future<Either<Failure, void>> call(NoParams params) {
    return authRepo.revokeToken();
  }
}
