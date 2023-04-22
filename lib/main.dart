import 'package:bememe/bememe.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseKey);
  runApp(const Bememe());
}

final supabase = Supabase.instance.client;

const supabaseUrl = 'https://dlbpvolnydaqoexyciiy.supabase.co';
final supabaseKey = const String.fromEnvironment('SUPABASE_KEY');
