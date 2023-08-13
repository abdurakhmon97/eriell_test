import 'package:eriell/presentation/auth/sign_in/sign_in_page.dart';
import 'package:eriell/presentation/auth/sign_up/sign_up_page.dart';
import 'package:eriell/presentation/home/home_page.dart';
import 'package:eriell/presentation/splash/splash_page.dart';
import 'package:eriell/routes/app_routes.dart';
import 'package:go_router/go_router.dart';

abstract class AppPages {
  static final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: Routes.splash,
        name: Routes.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: Routes.signIn,
        name: Routes.signIn,
        builder: (context, state) => const SignInPage(),
      ),
      GoRoute(
        path: Routes.signUp,
        name: Routes.signUp,
        builder: (context, state) => const SignUpPage(),
      ),
      GoRoute(
        path: Routes.home,
        name: Routes.home,
        builder: (context, state) => const HomePage(),
      ),
    ],
  );
}
