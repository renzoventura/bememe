import 'package:bememe/components/primary_button.dart';
import 'package:bememe/components/text_form.dart';
import 'package:bememe/main.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  static String path = "register";
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
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
                  await supabase.auth.signUp(
                    email: email.text,
                    password: password.text,
                  );
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
