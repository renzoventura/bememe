import 'package:bememe/routing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Bememe extends StatelessWidget {
  const Bememe({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp.router(
        theme: ThemeData.dark(),
        routerConfig: router,
      ),
    );
  }
}
