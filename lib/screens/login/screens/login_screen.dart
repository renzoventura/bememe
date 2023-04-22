import 'package:bememe/components/primary_button.dart';
import 'package:bememe/components/text_form.dart';
import 'package:bememe/main.dart';
import 'package:bememe/screens/feed_screen/screens/feed_screen.dart';
import 'package:bememe/screens/register/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginScreen extends StatefulWidget {
  static String path = "/";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('REGISTER'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Spacer(),
              TextForm(
                label: 'Email',
                controller: email,
              ),
              TextForm(
                label: 'password',
                controller: password,
              ),
              PrimaryButton(
                onTap: () async {
                  final AuthResponse res = await supabase.auth.signInWithPassword(
                    email: email.text,
                    password: password.text,
                  );
                },
                text: "Sign in",
              ),
              const Spacer(),
              PrimaryButton(
                onTap: () {
                  context.pushNamed(RegisterScreen.path);
                },
                text: 'Go to register',
              ),
              PrimaryButton(
                onTap: () {
                  supabase.auth.signOut();
                },
                text: 'Sign out',
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
