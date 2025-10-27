import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:waster/core/errors/failure.dart';
import 'package:waster/features/auth/domain/entity/auth_entity.dart';
import 'package:waster/features/auth/domain/repo/auth_repo.dart';

class RegisterParams extends Equatable {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String confirmPassword;

  const RegisterParams({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });
  @override
  List<Object?> get props => [
    firstName,
    lastName,
    email,
    password,
    confirmPassword,
  ];
}

class RegisterUseCase {
  final AuthRepo authRepo;

  RegisterUseCase({required this.authRepo});

  Future<Either<Failure, AuthEntity>> call(RegisterParams params) {
    return authRepo.register(
      firstName: params.firstName,
      lastName: params.lastName,
      email: params.email,
      password: params.password,
      confirmPassword: params.confirmPassword,
    );
  }
}
