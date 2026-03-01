import 'package:ahmed_task/Core/routing/app_routes.dart';
import 'package:ahmed_task/feature/splash/presentation/view/splash_view.dart';
import 'package:go_router/go_router.dart';

class RouterGenerationConfig {
  static final goRouter = GoRouter(
    initialLocation: AppRoutes.splashScreen,

    routes: [
      GoRoute(
        path: AppRoutes.splashScreen,
        name: AppRoutes.splashScreen,
        builder: (context, state) => const SplashView(),
      ),
    ],
  );
}
