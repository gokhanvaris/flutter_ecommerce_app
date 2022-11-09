import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/ui/login/login_view.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  final GoRouter router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context,
            GoRouterState state) {
          return const LoginView();
        },
      ),
    ],
  );
}
