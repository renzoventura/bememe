import 'package:bememe/screens/feed_screen/screens/feed_screen.dart';
import 'package:bememe/screens/login/screens/login_screen.dart';
import 'package:bememe/screens/register/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      name: Routes.login.name,
      path: LoginScreen.path,
      builder: (BuildContext context, GoRouterState state) {
        return const LoginScreen();
      },
      routes: [
        GoRoute(
          name: Routes.register.name,
          path: RegisterScreen.path,
          builder: (BuildContext context, GoRouterState state) {
            return const RegisterScreen();
          },
        ),
        GoRoute(
          name: Routes.feed.name,
          path: FeedScreen.path,
          builder: (BuildContext context, GoRouterState state) {
            return const FeedScreen();
          },
        ),
      ],
    ),
  ],
);

enum Routes { login, feed, register }
