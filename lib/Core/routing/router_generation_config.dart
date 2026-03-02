import 'package:ahmed_task/Core/routing/app_routes.dart';
import 'package:ahmed_task/feature/auth/presentation/view/register/view/register.dart';
import 'package:ahmed_task/feature/comments/presentation/view/comments_view.dart';
import 'package:ahmed_task/feature/create_post/presentation/view/create_post.dart';
import 'package:ahmed_task/feature/home/presentation/view/home_view.dart';
import 'package:ahmed_task/feature/splash/presentation/view/splash_view.dart';
import 'package:ahmed_task/feature/auth/presentation/view/login/view/login_view.dart';
import 'package:go_router/go_router.dart';

class RouterGenerationConfig {
  static final goRouter = GoRouter(
    initialLocation: AppRoutes.splashView,
    routes: [
      GoRoute(
        path: AppRoutes.splashView,
        name: AppRoutes.splashView,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: AppRoutes.logInView,
        name: AppRoutes.logInView,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: AppRoutes.registerView,
        name: AppRoutes.registerView,
        builder: (context, state) => const RegisterView(),
      ),
      GoRoute(
        path: AppRoutes.homeView,
        name: AppRoutes.homeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: AppRoutes.commentsView,
        name: AppRoutes.commentsView,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          return CommentsView(
            postTitle: extra?['postTitle'] as String? ?? '',
            commentsCount: extra?['commentsCount'] as int? ?? 0,
          );
        },
      ),
      GoRoute( 
        path:   AppRoutes.createPostView,
        name: AppRoutes.createPostView,
        builder: (context, state) => const CreatePostView(),
      )
    ],
  );
}
