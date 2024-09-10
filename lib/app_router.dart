import 'presentation/auth/login_page.dart';
import 'presentation/auth/register_page.dart';
import 'providers/auth.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'presentation/home/home_page.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => const HomePage(),
        redirect: (context, state) {
          if (context.read<AuthProvider>().isLoggedIn) {
            return '/auth';
          } else {
            return null;
          }
        },
      ),
      GoRoute(
        path: "/auth",
        routes: [
          GoRoute(
            path: "login",
            builder: (context, state) => const LoginPage(),
          ),
          GoRoute(
            path: "register",
            builder: (context, state) => const RegisterPage(),
          ),
        ],
        redirect: (context, state) {
          if (context.read<AuthProvider>().isLoggedIn) {
            return '/';
          } else {
            return null;
          }
        },
      ),
    ],
  );
}
