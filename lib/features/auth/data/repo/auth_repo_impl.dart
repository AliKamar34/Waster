import 'package:dartz/dartz.dart';
import 'package:waster/core/data/base_repository.dart';
import 'package:waster/core/errors/failure.dart';
import 'package:waster/core/networking/network_info.dart';
import 'package:waster/features/auth/data/datasource/auth_local_data_source.dart';
import 'package:waster/features/auth/data/datasource/auth_remote_date_source.dart';
import 'package:waster/features/auth/domain/entity/auth_entity.dart';
import 'package:waster/features/auth/domain/repo/auth_repo.dart';

class AuthRepoImpl extends BaseRepository implements AuthRepo {
  final AuthLocalDataSource authLocalDataSource;
  final AuthRemoteDateSource authRemoteDateSource;
  final NetworkInfo networkInfo;
  AuthRepoImpl({
    required this.authLocalDataSource,
    required this.authRemoteDateSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, AuthEntity>> login({
    required String email,
    required String password,
  }) async {
    // 0. Check internet connection
    if (!await networkInfo.isConnected) {
      return left(
        Failure('No internet connection. Please check your network.'),
      );
    }

    // 1. Execute login request
    final result = await execute(
      () => authRemoteDateSource.login(email: email, password: password),
    );

    // 2. If successful, save tokens
    return result.fold((failure) => Left(failure), (authEntity) async {
      final saveResult = await execute(
        () => authLocalDataSource.saveTokens(
          token: authEntity.token,
          refreshToken: authEntity.refreshToken,
        ),
      );

      return saveResult.fold(
        (failure) => Left(failure),
        (_) => Right(authEntity),
      );
    });
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
    // 0. Check internet connection
    if (!await networkInfo.isConnected) {
      return left(
        Failure('No internet connection. Please check your network.'),
      );
    }
    // 1. Execute register request
    final result = await execute(
      () => authRemoteDateSource.register(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
        confirmPassword: confirmPassword,
        phoneNumber: phoneNumber,
        address: address,
      ),
    );

    // 2. If successful, save tokens
    return result.fold((failure) => Left(failure), (authEntity) async {
      final saveResult = await execute(
        () => authLocalDataSource.saveTokens(
          token: authEntity.token,
          refreshToken: authEntity.refreshToken,
        ),
      );

      return saveResult.fold(
        (failure) => Left(failure),
        (_) => Right(authEntity),
      );
    });
  }

  @override
  Future<Either<Failure, AuthEntity>> refreshToken() async {
    // 1. Get refresh token from local storage
    final tokenResult = await execute(
      () => authLocalDataSource.getRefreshToken(),
    );

    return tokenResult.fold((failure) => Left(failure), (token) async {
      // 2. Validate token exists
      if (token == null || token.isEmpty) {
        return Left(Failure('No refresh token found'));
      }

      // 3. Request new tokens from remote
      final refreshResult = await execute(
        () => authRemoteDateSource.refreshToken(token: token),
      );

      // 4. Save new tokens if successful
      return refreshResult.fold((failure) => Left(failure), (authEntity) async {
        final saveResult = await execute(
          () => authLocalDataSource.saveTokens(
            token: authEntity.token,
            refreshToken: authEntity.refreshToken,
          ),
        );

        return saveResult.fold(
          (failure) => Left(failure),
          (_) => Right(authEntity),
        );
      });
    });
  }

  @override
  Future<Either<Failure, void>> revokeToken() async {
    // 1. Get refresh token from local storage
    final tokenResult = await execute(
      () => authLocalDataSource.getRefreshToken(),
    );

    return tokenResult.fold((failure) => Left(failure), (token) async {
      // 2. Validate token exists
      if (token == null || token.isEmpty) {
        return Left(Failure('No refresh token found'));
      }

      // 3. Revoke token on server
      final revokeResult = await execute(
        () => authRemoteDateSource.revokeToken(token: token),
      );

      // 4. Delete local tokens if successful
      return revokeResult.fold((failure) => Left(failure), (_) async {
        final deleteResult = await execute(
          () => authLocalDataSource.deleteTokens(),
        );

        return deleteResult.fold(
          (failure) => Left(failure),
          (_) => const Right(null),
        );
      });
    });
  }

  @override
  Future<Either<Failure, AuthEntity>> googleSignIn({
    required String idToken,
  }) async {
    final result = await execute(
      () => authRemoteDateSource.googleSignIn(idToken: idToken),
    );

    return result.fold((failure) => Left(failure), (authEntity) async {
      final saveResult = await execute(
        () => authLocalDataSource.saveTokens(
          token: authEntity.token,
          refreshToken: authEntity.refreshToken,
        ),
      );

      return saveResult.fold(
        (failure) => Left(failure),
        (_) => Right(authEntity),
      );
    });
  }
}
