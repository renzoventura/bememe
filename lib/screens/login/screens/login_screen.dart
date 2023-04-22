import 'package:bememe/components/primary_button.dart';
import 'package:bememe/screens/feed_screen/screens/feed_screen.dart';
import 'package:bememe/screens/register/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  static String path = "/";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LOGIN'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            PrimaryButton(
              onTap: () {
                context.pushNamed(RegisterScreen.path);
              },
              text: 'Go to register',
            ),
            PrimaryButton(
              onTap: () {
                context.pushNamed(FeedScreen.path);
              },
              text: 'Go to feed',
            ),
          ],
        ),
      ),
    );
  }
}
