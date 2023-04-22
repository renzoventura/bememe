import 'package:bememe/components/primary_button.dart';
import 'package:bememe/components/text_form.dart';
import 'package:bememe/main.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RegisterScreen extends StatefulWidget {
  static String path = "register";
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();

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
              TextForm(
                label: 'Username',
                controller: userName,
              ),
              TextForm(
                label: 'password',
                controller: password,
              ),
              PrimaryButton(
                onTap: () async {
                  final AuthResponse res = await supabase.auth.signUp(
                    email: userName.text,
                    password: password.text,
                  );
                  final Session? session = res.session;
                  print(session);
                  final User? user = res.user;
                  print(user);
                },
                text: "Register",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
