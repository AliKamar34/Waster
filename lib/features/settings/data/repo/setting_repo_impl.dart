import 'package:dartz/dartz.dart';
import 'package:waster/core/data/base_repository.dart';
import 'package:waster/core/errors/failure.dart';
import 'package:waster/features/auth/data/datasource/auth_local_data_source.dart';
import 'package:waster/features/settings/data/datasource/settings_remote_data_source.dart';
import 'package:waster/features/settings/domain/entity/user_entity.dart';
import 'package:waster/features/settings/domain/repo/settings_repo.dart';

class SettingsRepoImpl extends BaseRepository implements SettingsRepo {
  final SettingsRemoteDataSource settingsRemoteDataSource;
  final AuthLocalDataSource authLocalDataSource;

  SettingsRepoImpl({
    required this.settingsRemoteDataSource,
    required this.authLocalDataSource,
  });

  @override
  Future<Either<Failure, UserEntity>> getUserDetails() async {
    return execute(() => settingsRemoteDataSource.getUserDetails());
  }

  @override
  Future<Either<Failure, void>> updateName({
    required String firstName,
    required String lastName,
  }) async {
    return execute(
      () => settingsRemoteDataSource.updateName(
        firstName: firstName,
        lastName: lastName,
      ),
    );
  }

  @override
  Future<Either<Failure, void>> changeEmail({
    required String newEmail,
    required String password,
  }) async {
    return execute(
      () => settingsRemoteDataSource.changeEmail(
        newEmail: newEmail,
        password: password,
      ),
    );
  }

  @override
  Future<Either<Failure, void>> changePassword({
    required String currentPassword,
    required String newPassword,
    required String confirmPassword,
  }) async {
    return execute(
      () => settingsRemoteDataSource.changePassword(
        currentPassword: currentPassword,
        newPassword: newPassword,
        confirmPassword: confirmPassword,
      ),
    );
  }

  @override
  Future<Either<Failure, void>> updateLocation({
    required String address,
  }) async {
    return execute(
      () => settingsRemoteDataSource.updateLocation(address: address),
    );
  }

  @override
  Future<Either<Failure, void>> updatePhoneNumber({
    required String phoneNum,
  }) async {
    return execute(
      () => settingsRemoteDataSource.updatePhoneNumber(phoneNum: phoneNum),
    );
  }

  @override
  Future<Either<Failure, void>> updateBio({required String bio}) async {
    return execute(() => settingsRemoteDataSource.updateBio(bio: bio));
  }

  @override
  Future<Either<Failure, void>> deleteAccount({
    required String password,
  }) async {
    final deleteAccountResult = await execute(
      () => settingsRemoteDataSource.deleteAccount(password: password),
    );
    return deleteAccountResult.fold((failure) => Left(failure), (_) async {
      final deleteResult = await execute(
        () => authLocalDataSource.deleteTokens(),
      );

      return deleteResult.fold(
        (failure) => Left(failure),
        (_) => const Right(null),
      );
    });
  }
}
