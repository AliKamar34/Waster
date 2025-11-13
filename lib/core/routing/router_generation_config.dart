import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:waster/core/routing/app_routes.dart';
import 'package:waster/core/utils/service_locator.dart';
import 'package:waster/features/auth/presentation/views/log_in_view.dart';
import 'package:waster/features/auth/presentation/views/sign_up_view.dart';
import 'package:waster/features/browse/presentation/views/browse_all_view.dart';
import 'package:waster/features/browse/presentation/views/order_details_view.dart';
import 'package:waster/features/browse/presentation/views/track_all_view.dart';
import 'package:waster/features/home/domain/entity/enums/post_mode_enum.dart';
import 'package:waster/features/home/presentation/manager/bloc/post_bloc.dart';
import 'package:waster/features/home/presentation/views/donate_view.dart';
import 'package:waster/features/home/presentation/views/main_view.dart';
import 'package:waster/features/notifications/presentation/views/notifications_view.dart';
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
          final post = data['post'];
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
        builder: (context, state) => const BrowseAllView(),
      ),
      GoRoute(
        path: AppRoutes.orderDetailsView,
        name: AppRoutes.orderDetailsView,
        builder: (context, state) => const OrderDetailsView(),
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
    ],
  );
}
