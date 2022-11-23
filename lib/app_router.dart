import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/constants/enums/router_enums.dart';
import 'package:flutter_ecommerce_app/ui/home/home_view.dart';
import 'package:flutter_ecommerce_app/ui/login/login_view.dart';
import 'package:flutter_ecommerce_app/ui/register/register_view.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  final GoRouter router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: RouterEnums.LOGIN.value,
        builder: (BuildContext context,
            GoRouterState state) {
          return const LoginView();
        },
      ),
      GoRoute(
        path: RouterEnums.REGISTER.value,
        builder: (BuildContext context,
            GoRouterState state) {
          return const RegisterView();
        },
      ),
      GoRoute(
        path: RouterEnums.HOMEPAGE
            .value, // RouterEnums.HOMEPAGE.value
        builder: (BuildContext context,
            GoRouterState state) {
          return const HomeView();
        },
      ),
    ],
  );
}
