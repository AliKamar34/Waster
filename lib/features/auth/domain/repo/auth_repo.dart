import 'package:dartz/dartz.dart';
import 'package:waster/core/errors/failure.dart';
import 'package:waster/features/auth/domain/entity/auth_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, AuthEntity>> login({
    required String email,
    required String password,
  });
  Future<Either<Failure, AuthEntity>> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String confirmPassword,
    required String phoneNumber,
    required String address,
  });
  Future<Either<Failure, AuthEntity>> refreshToken();
  Future<Either<Failure, void>> revokeToken();
  Future<Either<Failure, AuthEntity>> googleSignIn({required String idToken});
}
