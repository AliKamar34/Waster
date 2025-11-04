import 'package:dartz/dartz.dart';
import 'package:waster/core/errors/cache_exception.dart';
import 'package:waster/core/errors/failure.dart';
import 'package:waster/core/errors/server_exception.dart';
import 'package:waster/features/auth/data/datasource/auth_local_data_source.dart';
import 'package:waster/features/auth/data/datasource/auth_remote_date_source.dart';
import 'package:waster/features/auth/domain/entity/auth_entity.dart';
import 'package:waster/features/auth/domain/repo/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthLocalDataSource authLocalDataSource;
  final AuthRemoteDateSource authRemoteDateSource;

  const AuthRepoImpl({
    required this.authLocalDataSource,
    required this.authRemoteDateSource,
  });
  @override
  Future<Either<Failure, AuthEntity>> login({
    required String email,
    required String password,
  }) async {
    try {
      final result = await authRemoteDateSource.login(
        email: email,
        password: password,
      );
      await authLocalDataSource.saveTokens(
        token: result.token,
        refreshToken: result.refreshToken,
      );
      return right(result);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    } on CacheException catch (e) {
      return left(Failure(e.message));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthEntity>> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String confirmPassword,
    required String phoneNumber,
    required String address,
  }) async {
    try {
      final result = await authRemoteDateSource.register(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
        confirmPassword: confirmPassword,
        phoneNumber: phoneNumber,
        address: address,
      );
      await authLocalDataSource.saveTokens(
        token: result.token,
        refreshToken: result.refreshToken,
      );
      return right(result);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    } on CacheException catch (e) {
      return left(Failure(e.message));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthEntity>> refreshToken() async {
    try {
      final token = await authLocalDataSource.getRefreshToken();
      if (token == null) {
        return left(Failure('No token found'));
      }
      final result = await authRemoteDateSource.refreshToken(token: token);
      await authLocalDataSource.saveTokens(
        token: result.token,
        refreshToken: result.refreshToken,
      );
      return right(result);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    } on CacheException catch (e) {
      return left(Failure(e.message));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> revokeToken() async {
    try {
      final token = await authLocalDataSource.getRefreshToken();
      if (token == null) {
        return left(Failure('No token found'));
      }
      await authRemoteDateSource.revokeToken(token: token);
      await authLocalDataSource.deleteTokens();
      return right(null);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    } on CacheException catch (e) {
      return left(Failure(e.message));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
