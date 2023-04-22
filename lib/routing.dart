import 'package:bememe/screens/feed_screen/screens/feed_screen.dart';
import 'package:bememe/screens/login/screens/login_screen.dart';
import 'package:bememe/screens/register/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const LoginScreen();
      },
    ),
    GoRoute(
      path: '/feed',
      builder: (BuildContext context, GoRouterState state) {
        return const FeedScreen();
      },
    ),
    GoRoute(
      path: '/register',
      builder: (BuildContext context, GoRouterState state) {
        return const RegisterScreen();
      },
    ),
  ],
);
