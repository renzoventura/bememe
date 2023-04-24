import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:bememe/components/primary_button.dart';
import 'package:bememe/components/text_form.dart';
import 'package:flutter/material.dart';
import 'package:bememe/routing.dart';
import 'package:bememe/screens/register/register_provider.dart';
import 'package:bememe/utils/show_popup.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  static String path = "register";
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
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
    final provider = ref.watch(registerProvider.notifier);
    final registerState = ref.watch(registerProvider);

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
                onChange: provider.setEmail,
              ),
              TextForm(
                label: 'password',
                controller: password,
                onChange: provider.setPassword,
              ),
              registerState.isLoading
                  ? const CircularProgressIndicator()
                  : PrimaryButton(
                      onTap: () {
                        provider.register().then((value) {
                          if (value == null) {
                            context.pushNamed(Routes.successRegister.name);
                          } else {
                            showPopup(value);
                          }
                        });
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
