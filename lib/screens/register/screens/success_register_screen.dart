import 'package:go_router/go_router.dart';
import 'package:bememe/components/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:bememe/routing.dart';

class SuccessRegisterScreen extends StatelessWidget {
  static String path = "success-register";
  const SuccessRegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Registered Successfully!'),
            const SizedBox(height: 16),
            PrimaryButton(
                onTap: () {
                  context.pushNamed(Routes.home.name);
                },
                text: 'Let\'s get started'),
          ],
        ),
      ),
    );
  }
}
