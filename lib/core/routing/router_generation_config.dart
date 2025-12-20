import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:waster/core/entity/post_entity.dart';
import 'package:waster/core/routing/app_routes.dart';
import 'package:waster/core/utils/service_locator.dart';
import 'package:waster/features/auth/presentation/views/log_in_view.dart';
import 'package:waster/features/auth/presentation/views/sign_up_view.dart';
import 'package:waster/features/browse/presentation/manager/categories_cubit/categories_cubit.dart';
import 'package:waster/features/browse/presentation/manager/search_cubit/search_cubit.dart';
import 'package:waster/features/browse/presentation/views/browse_all_view.dart';
import 'package:waster/features/browse/presentation/views/order_details_view.dart';
import 'package:waster/features/browse/presentation/views/track_all_view.dart';
import 'package:waster/features/claim/presentation/views/claim_view.dart';
import 'package:waster/features/home/presentation/views/main_view.dart';
import 'package:waster/features/notifications/presentation/views/notifications_view.dart';
import 'package:waster/features/post/domain/entity/enums/post_mode_enum.dart';
import 'package:waster/features/post/presentation/manager/bloc/post_bloc.dart';
import 'package:waster/features/post/presentation/manager/book_mark_cubit/book_mark_cubit.dart';
import 'package:waster/features/post/presentation/manager/get_all_user_posts_cubit/get_all_user_posts_cubit.dart';
import 'package:waster/features/post/presentation/views/book_mark_view.dart';
import 'package:waster/features/post/presentation/views/donate_view.dart';
import 'package:waster/features/post/presentation/views/my_posts_view.dart';
import 'package:waster/features/settings/domain/entity/user_entity.dart';
import 'package:waster/features/settings/presentation/manager/bloc/settings_bloc.dart';
import 'package:waster/features/settings/presentation/views/profile_editing_view.dart';
import 'package:waster/features/settings/presentation/views/settings_view.dart';
import 'package:waster/features/start/views/splash_view.dart';
import 'package:waster/features/start/views/start_view.dart';

class RouterGenerationConfig {
  static GoRouter goRoute = GoRouter(
    initialLocation: AppRoutes.splachView,
    routes: [
      GoRoute(
        path: AppRoutes.splachView,
        name: AppRoutes.splachView,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: AppRoutes.start,
        name: AppRoutes.start,
        builder: (context, state) => const StartView(),
      ),
      GoRoute(
        path: AppRoutes.login,
        name: AppRoutes.login,
        builder: (context, state) => const LogInView(),
      ),
      GoRoute(
        path: AppRoutes.singUp,
        name: AppRoutes.singUp,
        builder: (context, state) => const SignUpView(),
      ),
      GoRoute(
        path: AppRoutes.mainView,
        name: AppRoutes.mainView,
        builder: (context, state) => const MainView(),
      ),
      GoRoute(
        path: AppRoutes.donateView,
        name: AppRoutes.donateView,
        builder: (context, state) {
          final data = state.extra as Map<String, dynamic>;
          final postMode = data['postMode'] as PostMode;
          final post = data['post'] as PostEntity?;
          return BlocProvider(
            create: (context) => sl<PostBloc>(),
            child: DonateView(postMode: postMode, post: post),
          );
        },
      ),
      GoRoute(
        path: AppRoutes.trackAllView,
        name: AppRoutes.trackAllView,
        builder: (context, state) => const TrackAllView(),
      ),
      GoRoute(
        path: AppRoutes.browseAllView,
        name: AppRoutes.browseAllView,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => sl<SearchPostsCubit>()),
            BlocProvider(
              create: (context) => sl<CategoriesCubit>()..loadCategories(),
            ),
            BlocProvider.value(value: sl<BookmarkCubit>()),
          ],
          child: const BrowseAllView(),
        ),
      ),
      GoRoute(
        path: AppRoutes.orderDetailsView,
        name: AppRoutes.orderDetailsView,
        builder: (context, state) {
          final data = state.extra as Map<String, dynamic>;
          final postAction = data['postAction'] as Widget;
          final post = data['post'] as PostEntity;
          return BlocProvider.value(
            value: sl<BookmarkCubit>(),
            child: OrderDetailsView(postEntity: post, postAction: postAction),
          );
        },
      ),
      GoRoute(
        path: AppRoutes.settingsView,
        name: AppRoutes.settingsView,
        builder: (context, state) => const SettingsView(),
      ),
      GoRoute(
        path: AppRoutes.profileEditingView,
        name: AppRoutes.profileEditingView,
        builder: (context, state) {
          final data = state.extra as Map<String, dynamic>;
          final bloc = data['bloc'] as SettingsBloc;
          final user = data['user'] as UserEntity;
          return BlocProvider.value(
            value: bloc,
            child: ProfileEditingView(user: user),
          );
        },
      ),
      GoRoute(
        path: AppRoutes.notificationsView,
        name: AppRoutes.notificationsView,
        builder: (context, state) => const NotificationsView(),
      ),
      GoRoute(
        path: AppRoutes.myPostsView,
        name: AppRoutes.myPostsView,
        builder: (context, state) => BlocProvider(
          create: (context) => sl<GetAllUserPostsCubit>(),
          child: const MyPostsView(),
        ),
      ),
      GoRoute(
        path: AppRoutes.bookMarks,
        name: AppRoutes.bookMarks,
        builder: (context, state) => BlocProvider.value(
          value: sl<BookmarkCubit>(),
          child: const BookMarkView(),
        ),
      ),
      GoRoute(
        path: AppRoutes.claimView,
        name: AppRoutes.claimView,
        builder: (context, state) => const ClaimView(),
      ),
    ],
  );
}
