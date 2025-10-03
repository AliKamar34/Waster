import 'package:go_router/go_router.dart';
import 'package:waster/core/routing/app_routes.dart';
import 'package:waster/features/auth/presentation/views/log_in_view.dart';
import 'package:waster/features/auth/presentation/views/sign_up_view.dart';
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
    ],
  );
}
