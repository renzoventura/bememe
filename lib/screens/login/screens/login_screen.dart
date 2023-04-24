import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bememe/components/primary_button.dart';
import 'package:bememe/components/text_form.dart';
import 'package:bememe/routing.dart';
import 'package:bememe/screens/login/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:bememe/utils/show_popup.dart';

class LoginScreen extends ConsumerStatefulWidget {
  static String path = "/login";
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
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
    final provider = ref.watch(loginProvider.notifier);
    final state = ref.watch(loginProvider);
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
                onChange: provider.setEmail,
              ),
              TextForm(
                label: 'password',
                controller: password,
                onChange: provider.setPassword,
              ),
              const SizedBox(height: 64),
              state.isLoading
                  ? const CircularProgressIndicator()
                  : PrimaryButton(
                      onTap: () {
                        provider.login().then((value) {
                          if (value == null) {
                            context.pushNamed(Routes.home.name);
                          } else {
                            showPopup(value);
                          }
                        });
                      },
                      text: "Login",
                    ),
              PrimaryButton(
                onTap: () {
                  context.pushNamed(Routes.register.name);
                },
                text: 'Register',
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
