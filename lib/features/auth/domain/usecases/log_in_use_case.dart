import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:waster/core/errors/failure.dart';
import 'package:waster/features/auth/domain/entity/auth_entity.dart';
import 'package:waster/features/auth/domain/repo/auth_repo.dart';

class LogInParams extends Equatable {
  final String email;
  final String password;

  const LogInParams({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}

class LogInUseCase {
  final AuthRepo authRepo;

  LogInUseCase({required this.authRepo});

  Future<Either<Failure, AuthEntity>> call(LogInParams params) {
    return authRepo.login(email: params.email, password: params.password);
  }
}
