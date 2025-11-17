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
import 'package:waster/features/post/data/datasource/post_remote_data_source.dart';
import 'package:waster/features/post/data/repo/post_repo_impl.dart';
import 'package:waster/features/post/domain/repo/post_repo.dart';
import 'package:waster/features/post/domain/usecases/add_donation_post_usecase.dart';
import 'package:waster/features/post/domain/usecases/edit_donation_post_usecase.dart';
import 'package:waster/features/post/domain/usecases/process_image_usecase.dart';
import 'package:waster/features/post/presentation/manager/bloc/post_bloc.dart';
import 'package:waster/features/post/presentation/manager/cubit/donate_form_cubit.dart';
import 'package:waster/features/settings/data/datasource/settings_remote_data_source.dart';
import 'package:waster/features/settings/data/repo/setting_repo_impl.dart';
import 'package:waster/features/settings/domain/repo/settings_repo.dart';
import 'package:waster/features/settings/domain/usecases/change_email_use_case.dart';
import 'package:waster/features/settings/domain/usecases/change_password_use_case.dart';
import 'package:waster/features/settings/domain/usecases/get_user_details_use_case.dart';
import 'package:waster/features/settings/domain/usecases/save_profile_changes_use_case.dart';
import 'package:waster/features/settings/presentation/manager/bloc/settings_bloc.dart';

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

  // Feature - settings
  // Data source
  sl.registerLazySingleton<SettingsRemoteDataSource>(
    () => SettingsRemoteDataSourceImpl(dioHelper: sl()),
  );
  // Repo
  sl.registerLazySingleton<SettingsRepo>(
    () => SettingsRepoImpl(settingsRemoteDataSource: sl()),
  );
  // use cases
  sl.registerLazySingleton<ChangeEmailUseCase>(
    () => ChangeEmailUseCase(settingsRepo: sl()),
  );
  sl.registerLazySingleton<ChangePasswordUseCase>(
    () => ChangePasswordUseCase(settingsRepo: sl()),
  );
  sl.registerLazySingleton<GetUserDetailsUseCase>(
    () => GetUserDetailsUseCase(settingsRepo: sl()),
  );
  sl.registerLazySingleton<SaveProfileChangesUseCase>(
    () => SaveProfileChangesUseCase(settingsRepo: sl()),
  );

  // bloc
  sl.registerFactory(
    () => SettingsBloc(
      getUserDetailsUseCase: sl(),
      saveProfileChangesUseCase: sl(),
      changeEmailUseCase: sl(),
      changePasswordUseCase: sl(),
    ),
  );

  // Feature - Home
  // Data source
  sl.registerLazySingleton<PostRemoteDataSource>(
    () => PostRemoteDataSourceImpl(dioHelper: sl()),
  );
  // Repo
  sl.registerLazySingleton<PostRepo>(
    () => PostRepoImpl(homeRemoteDataSource: sl()),
  );
  // use cases
  sl.registerLazySingleton<AddDonationPostUsecase>(
    () => AddDonationPostUsecase(postRepo: sl()),
  );
  sl.registerLazySingleton<EditDonationPostUsecase>(
    () => EditDonationPostUsecase(postRepo: sl()),
  );
  sl.registerLazySingleton<ProcessImageUseCase>(() => ProcessImageUseCase());

  // bloc
  sl.registerFactory(
    () => PostBloc(
      addDonationPostUsecase: sl(),
      editDonationPostUsecase: sl(),
      processImageUseCase: sl(),
    ),
  );
  sl.registerFactory(() => DonateFormCubit());
}
