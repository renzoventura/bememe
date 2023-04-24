import 'package:bememe/main.dart';
import 'package:bememe/screens/create/screens/create_meme_screen.dart';
import 'package:bememe/screens/home/screens/home_screen.dart';
import 'package:bememe/screens/login/screens/login_screen.dart';
import 'package:bememe/screens/register/screens/register_screen.dart';
import 'package:bememe/screens/setting/screens/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:bememe/screens/register/screens/success_register_screen.dart';
import 'package:bememe/splash_screen.dart';

final GoRouter router = GoRouter(
  redirect: redirect,
  routes: routes,
);

Future<String?> redirect(BuildContext context, GoRouterState state) async {
  print('Routing to ${state.location}');

  bool isSplashScreen = state.location == SplashScreen.path;
  bool isLoggedIn = supabase.auth.currentSession != null;

  //redirect if splash screen
  if (isSplashScreen) {
    if (isLoggedIn) {
      return HomeScreen.path; //if has current session go to feed screen
    } else {
      return LoginScreen.path; //if no current session go to login screen
    }
  }
  return null;
}

List<RouteBase> get routes => [
      // Splash screen
      GoRoute(
        name: Routes.splash.name,
        path: SplashScreen.path,
        builder: (context, state) => const SplashScreen(),
      ),

      //Authorization Routes
      GoRoute(
        name: Routes.login.name,
        path: LoginScreen.path,
        builder: (BuildContext c, GoRouterState s) => const LoginScreen(),
        routes: [
          GoRoute(
            name: Routes.register.name,
            path: RegisterScreen.path,
            builder: (BuildContext c, GoRouterState s) => const RegisterScreen(),
          ),
          GoRoute(
            name: Routes.successRegister.name,
            path: SuccessRegisterScreen.path,
            builder: (BuildContext c, GoRouterState s) => const SuccessRegisterScreen(),
          ),
        ],
      ),

      //MindShare Routes
      GoRoute(
        name: Routes.home.name,
        path: HomeScreen.path,
        builder: (BuildContext c, GoRouterState s) => const HomeScreen(),
        routes: [
          GoRoute(
            name: Routes.createMeme.name,
            path: CreateMemeScreen.path,
            builder: (BuildContext c, GoRouterState s) => const CreateMemeScreen(),
          ),
          GoRoute(
            name: Routes.settings.name,
            path: SettingsScreen.path,
            builder: (BuildContext c, GoRouterState s) => const SettingsScreen(),
          ),
        ],
      ),
    ];

enum Routes {
  splash,
  login,
  home,
  register,
  successRegister,
  createMeme,
  settings,
}
