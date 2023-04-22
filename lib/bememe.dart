import 'package:bememe/routing.dart';
import 'package:flutter/material.dart';

class Bememe extends StatelessWidget {
  const Bememe({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}
