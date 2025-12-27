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
import 'package:waster/features/auth/domain/usecases/sign_in_with_google.dart';
import 'package:waster/features/auth/presentation/manager/bloc/auth_bloc.dart';
import 'package:waster/features/browse/data/datasource/browse_remote_data_source.dart';
import 'package:waster/features/browse/data/repo/browse_repo_impl.dart';
import 'package:waster/features/browse/domain/repo/browse_repo.dart';
import 'package:waster/features/browse/domain/usecase/categories_use_case.dart';
import 'package:waster/features/browse/domain/usecase/expiring_soon_posts_use_case.dart';
import 'package:waster/features/claim/data/datasource/claim_remote_data_source.dart';
import 'package:waster/features/claim/data/repo/claim_repo_impl.dart';
import 'package:waster/features/claim/domain/repo/claim_repo.dart';
import 'package:waster/features/claim/domain/usecase/aprove_claim_use_case.dart';
import 'package:waster/features/claim/domain/usecase/cancle_claim_use_case.dart';
import 'package:waster/features/claim/domain/usecase/claim_post_use_case.dart';
import 'package:waster/features/claim/domain/usecase/get_post_claims_use_case.dart';
import 'package:waster/features/claim/domain/usecase/get_user_claims_use_case.dart';
import 'package:waster/features/claim/domain/usecase/reject_claim_use_case.dart';
import 'package:waster/features/claim/presentation/manager/cubit/claim_cubit.dart';
import 'package:waster/features/home/data/datasource/home_remote_data_source.dart';
import 'package:waster/features/home/data/repo/home_repo_impl.dart';
import 'package:waster/features/home/domain/repo/home_repo.dart';
import 'package:waster/features/home/domain/usecases/feed_posts_use_case.dart';
import 'package:waster/features/browse/domain/usecase/serach_post_use_case.dart';
import 'package:waster/features/browse/presentation/manager/categories_cubit/categories_cubit.dart';
import 'package:waster/features/browse/presentation/manager/expiring_soon_cubit/expiring_soon_cubit.dart';
import 'package:waster/features/home/presentation/manager/feed_cubit/feed_cubit.dart';
import 'package:waster/features/browse/presentation/manager/search_cubit/search_cubit.dart';
import 'package:waster/features/post/data/datasource/post_remote_data_source.dart';
import 'package:waster/features/post/data/repo/post_repo_impl.dart';
import 'package:waster/features/post/domain/repo/post_repo.dart';
import 'package:waster/features/post/domain/usecases/add_book_mark_use_case.dart';
import 'package:waster/features/post/domain/usecases/add_donation_post_usecase.dart';
import 'package:waster/features/post/domain/usecases/delete_book_mark_use_case.dart';
import 'package:waster/features/post/domain/usecases/delete_post_usecase.dart';
import 'package:waster/features/post/domain/usecases/edit_donation_post_usecase.dart';
import 'package:waster/features/post/domain/usecases/get_all_book_mark_use_case.dart';
import 'package:waster/features/post/domain/usecases/get_all_user_posts_usecase.dart';
import 'package:waster/features/post/domain/usecases/process_image_usecase.dart';
import 'package:waster/features/post/presentation/manager/bloc/post_bloc.dart';
import 'package:waster/features/post/presentation/manager/book_mark_cubit/book_mark_cubit.dart';
import 'package:waster/features/post/presentation/manager/get_all_user_posts_cubit/get_all_user_posts_cubit.dart';
import 'package:waster/features/settings/data/datasource/settings_remote_data_source.dart';
import 'package:waster/features/settings/data/repo/setting_repo_impl.dart';
import 'package:waster/features/settings/domain/repo/settings_repo.dart';
import 'package:waster/features/settings/domain/usecases/change_email_use_case.dart';
import 'package:waster/features/settings/domain/usecases/change_password_use_case.dart';
import 'package:waster/features/settings/domain/usecases/delete_account_use_case.dart';
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
  sl.registerLazySingleton<GoogleSignInUseCase>(
    () => GoogleSignInUseCase(authRepo: sl()),
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
      googleSignInUseCase: sl(),
    ),
  );

  // Feature - settings
  // Data source
  sl.registerLazySingleton<SettingsRemoteDataSource>(
    () => SettingsRemoteDataSourceImpl(dioHelper: sl()),
  );
  // Repo
  sl.registerLazySingleton<SettingsRepo>(
    () => SettingsRepoImpl(
      authLocalDataSource: sl(),
      settingsRemoteDataSource: sl(),
    ),
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
  sl.registerLazySingleton<DeleteAccountUseCase>(
    () => DeleteAccountUseCase(settingsRepo: sl()),
  );
  // bloc
  sl.registerFactory(
    () => SettingsBloc(
      deleteAccountUseCase: sl(),
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
    () => PostRepoImpl(postRemoteDataSource: sl()),
  );
  // use cases
  sl.registerLazySingleton<AddDonationPostUsecase>(
    () => AddDonationPostUsecase(postRepo: sl(), processImageUseCase: sl()),
  );
  sl.registerLazySingleton<EditDonationPostUsecase>(
    () => EditDonationPostUsecase(postRepo: sl(), processImageUseCase: sl()),
  );
  sl.registerLazySingleton<ProcessImageUseCase>(() => ProcessImageUseCase());
  sl.registerLazySingleton<GetAllUsersPostsUseCase>(
    () => GetAllUsersPostsUseCase(postRepo: sl()),
  );
  sl.registerLazySingleton<DeletePostUsecase>(
    () => DeletePostUsecase(postRepo: sl()),
  );
  sl.registerLazySingleton<AddBookMarkUseCase>(
    () => AddBookMarkUseCase(postRepo: sl()),
  );

  sl.registerLazySingleton<DeleteBookMarkUseCase>(
    () => DeleteBookMarkUseCase(postRepo: sl()),
  );

  sl.registerLazySingleton<GetAllBookMarkUseCase>(
    () => GetAllBookMarkUseCase(postRepo: sl()),
  );

  // bloc
  sl.registerFactory(
    () => PostBloc(
      addDonationPostUsecase: sl(),
      editDonationPostUsecase: sl(),
      deletePostUsecase: sl(),
    ),
  );
  sl.registerFactory(() => GetAllUserPostsCubit(getAllUsersPostsUseCase: sl()));
  sl.registerLazySingleton<BookmarkCubit>(
    () => BookmarkCubit(
      addBookMarkUseCase: sl(),
      deleteBookMarkUseCase: sl(),
      getAllBookMarkUseCase: sl(),
    ),
  );

  // Feature - Browse
  // Data source
  sl.registerLazySingleton<BrowseRemoteDateSource>(
    () => BrowseRemoteDataSourceImpl(dioHelper: sl()),
  );

  // Repo
  sl.registerLazySingleton<BrowseRepo>(
    () => BrowseRepoImpl(browseRemoteDateSource: sl()),
  );

  // Use cases
  sl.registerLazySingleton<CategoriesUseCase>(
    () => CategoriesUseCase(browseRepo: sl()),
  );
  sl.registerLazySingleton<ExpiringSoonPostsUseCase>(
    () => ExpiringSoonPostsUseCase(browseRepo: sl()),
  );
  sl.registerLazySingleton<SerachPostUseCase>(
    () => SerachPostUseCase(browseRepo: sl()),
  );

  // Cubit
  sl.registerFactory(
    () =>
        ExpiringSoonCubit(bookmarkCubit: sl(), expiringSoonPostsUseCase: sl()),
  );
  sl.registerFactory(
    () => SearchPostsCubit(bookmarkCubit: sl(), searchPostUseCase: sl()),
  );
  sl.registerFactory(() => CategoriesCubit(categoriesUseCase: sl()));

  // Feature - home
  // Data source
  sl.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(dioHelper: sl()),
  );

  // Repo
  sl.registerLazySingleton<HomeRepo>(
    () => HomeRepoImpl(homeRemoteDataSource: sl()),
  );

  //use case
  sl.registerLazySingleton<FeedPostsUseCase>(
    () => FeedPostsUseCase(homeRepo: sl()),
  );

  // Cubit
  sl.registerFactory(
    () => FeedPostsCubit(bookmarkCubit: sl(), feedPostsUseCase: sl()),
  );

  // Feature - Claim
  // Data source
  sl.registerLazySingleton<ClaimRemoteDataSource>(
    () => ClaimRemoteDataSourceImpl(dioHelper: sl()),
  );

  // Repo
  sl.registerLazySingleton<ClaimRepo>(
    () => ClaimRepoImpl(claimRemoteDataSource: sl()),
  );

  //use case
  sl.registerLazySingleton<ApproveClaimUseCase>(
    () => ApproveClaimUseCase(claimRepo: sl()),
  );
  sl.registerLazySingleton<CancelClaimUseCase>(
    () => CancelClaimUseCase(claimRepo: sl()),
  );
  sl.registerLazySingleton<RejectClaimUseCase>(
    () => RejectClaimUseCase(claimRepo: sl()),
  );
  sl.registerLazySingleton<ClaimPostUseCase>(
    () => ClaimPostUseCase(claimRepo: sl()),
  );
  sl.registerLazySingleton<GetPostClaimsUseCase>(
    () => GetPostClaimsUseCase(claimRepo: sl()),
  );
  sl.registerLazySingleton<GetUserClaimsUseCase>(
    () => GetUserClaimsUseCase(claimRepo: sl()),
  );

  // Cubit
  sl.registerFactory(
    () => ClaimCubit(
      claimPostUseCase: sl(),
      getPostClaimsUseCase: sl(),
      getUserClaimsUseCase: sl(),
      approveClaimUseCase: sl(),
      rejectClaimUseCase: sl(),
      cancelClaimUseCase: sl(),
    ),
  );
}
