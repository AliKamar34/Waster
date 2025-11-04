import 'package:dartz/dartz.dart';
import 'package:waster/core/errors/failure.dart';
import 'package:waster/core/errors/server_exception.dart';
import 'package:waster/features/settings/data/datasource/settings_remote_data_source.dart';
import 'package:waster/features/settings/domain/entity/user_entity.dart';
import 'package:waster/features/settings/domain/repo/settings_repo.dart';

class SettingRepoImpl implements SettingsRepo {
  final SettingsRemoteDataSource settingsRemoteDataSource;

  const SettingRepoImpl({required this.settingsRemoteDataSource});

  //  Helper Method
  Future<Either<Failure, T>> _execute<T>(Future<T> Function() operation) async {
    try {
      final result = await operation();
      return right(result);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getUserDetails() async {
    return _execute(() => settingsRemoteDataSource.getUserDetails());
  }

  @override
  Future<Either<Failure, void>> updateName({
    required String firstName,
    required String lastName,
  }) async {
    return _execute(
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
    return _execute(
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
    return _execute(
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
    return _execute(
      () => settingsRemoteDataSource.updateLocation(address: address),
    );
  }

  @override
  Future<Either<Failure, void>> updatePhoneNumber({
    required String phoneNum,
  }) async {
    return _execute(
      () => settingsRemoteDataSource.updatePhoneNumber(phoneNum: phoneNum),
    );
  }

  @override
  Future<Either<Failure, void>> updateBio({required String bio}) async {
    return _execute(() => settingsRemoteDataSource.updateBio(bio: bio));
  }
}
