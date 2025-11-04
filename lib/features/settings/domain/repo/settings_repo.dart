import 'package:dartz/dartz.dart';
import 'package:waster/core/errors/failure.dart';
import 'package:waster/features/settings/domain/entity/user_entity.dart';

abstract class SettingsRepo {
  Future<Either<Failure, UserEntity>> getUserDetails();
  Future<Either<Failure, void>> updateName({
    required String firstName,
    required String lastName,
  });
  Future<Either<Failure, void>> changeEmail({
    required String newEmail,
    required String password,
  });
  Future<Either<Failure, void>> changePassword({
    required String currentPassword,
    required String newPassword,
    required String confirmPassword,
  });
  Future<Either<Failure, void>> updateLocation({required String address});
  Future<Either<Failure, void>> updatePhoneNumber({required String phoneNum});
  Future<Either<Failure, void>> updateBio({required String bio});
}
