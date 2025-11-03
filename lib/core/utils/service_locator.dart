import 'package:get_it/get_it.dart';
import 'package:waster/core/networking/auth_interceptor.dart';
import 'package:waster/core/networking/dio_helper.dart';
import 'package:waster/core/utils/secure_storage_helper.dart';
import 'package:waster/features/auth/data/datasource/auth_local_data_source.dart';
import 'package:waster/features/auth/data/datasource/auth_remote_date_source.dart';
import 'package:waster/features/auth/data/repo/auth_repo_impl.dart';
import 'package:waster/features/auth/domain/repo/auth_repo.dart';
import 'package:waster/features/auth/domain/usecases/log_in_use_case.dart';
import 'package:waster/features/auth/domain/usecases/refresh_token_use_case.dart';
import 'package:waster/features/auth/domain/usecases/register_use_case.dart';
import 'package:waster/features/auth/domain/usecases/revoke_token_use_case.dart';
import 'package:waster/features/auth/presentation/manager/bloc/auth_bloc.dart';

final GetIt sl = GetIt.instance;

void setupServiceLocator() {
  // External
  sl.registerLazySingleton<SecureStorageHelper>(() => SecureStorageHelper());
  sl.registerLazySingleton<DioHelper>(() => DioHelper());

  // Features - Auth
  // Data sources
  sl.registerLazySingleton<AuthRemoteDateSource>(
    () => AuthRemoteDateSourceImpl(dioHelper: sl()),
  );
  sl.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(secureStorageHelper: sl()),
  );

  // Repositories
  sl.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(authLocalDataSource: sl(), authRemoteDateSource: sl()),
  );

  // Use cases
  sl.registerLazySingleton<LogInUseCase>(() => LogInUseCase(authRepo: sl()));
  sl.registerLazySingleton<RegisterUseCase>(
    () => RegisterUseCase(authRepo: sl()),
  );
  sl.registerLazySingleton<RefreshTokenUseCase>(
    () => RefreshTokenUseCase(authRepo: sl()),
  );
  sl.registerLazySingleton<RevokeTokenUseCase>(
    () => RevokeTokenUseCase(authRepo: sl()),
  );

  // Auth Interceptor
  sl.registerLazySingleton(
    () => AuthInterceptor(
      localDataSource: sl(),
      remoteDataSource: sl(),
      dio: sl<DioHelper>().dio,
    ),
  );

  sl<DioHelper>().addInterceptor(sl<AuthInterceptor>());

  // Bloc
  sl.registerFactory(
    () => AuthBloc(
      logInUseCase: sl(),
      registerUseCase: sl(),
      refreshTokenUseCase: sl(),
      revokeTokenUseCase: sl(),
    ),
  );
}
