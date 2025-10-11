import 'package:go_router/go_router.dart';
import 'package:waster/core/routing/app_routes.dart';
import 'package:waster/features/auth/presentation/views/log_in_view.dart';
import 'package:waster/features/auth/presentation/views/sign_up_view.dart';
import 'package:waster/features/browse/presentation/views/browse_all_view.dart';
import 'package:waster/features/browse/presentation/views/order_details_view.dart';
import 'package:waster/features/browse/presentation/views/track_all_view.dart';
import 'package:waster/features/home/presentation/views/donate_view.dart';
import 'package:waster/features/home/presentation/views/main_view.dart';
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
        builder: (context, state) => const DonateView(),
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
        builder: (context, state) => const ProfileEditingView(),
      ),
    ],
  );
}
