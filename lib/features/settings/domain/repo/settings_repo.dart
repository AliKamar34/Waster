import 'package:dartz/dartz.dart';
import 'package:waster/core/errors/failure.dart';
import 'package:waster/features/settings/domain/entity/user_entity.dart';

abstract class SettingsRepo {
  Future<Either<Failure, UserEntity>> getUserDetails();
  Future<Either<Failure, UserEntity>> updateName({
    required String firstName,
    required String lastName,
  });
  Future<Either<Failure, UserEntity>> changeEmail({
    required String newEmail,
    required String password,
  });
  Future<Either<Failure, UserEntity>> changePassword({
    required String currentPassword,
    required String newPassword,
    required String confirmPassword,
  });
  Future<Either<Failure, UserEntity>> updateLocation({required String address});
  Future<Either<Failure, UserEntity>> updatePhoneNumber({
    required String phoneNum,
  });
  Future<Either<Failure, UserEntity>> updateBio({required String bio});
}
