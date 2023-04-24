import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bememe/main.dart';
import 'package:bememe/screens/register/register_state.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final memeFeedProvider = StateNotifierProvider<MemeFeedProvider, RegisterState>((ref) => MemeFeedProvider());

class MemeFeedProvider extends StateNotifier<RegisterState> {
  MemeFeedProvider() : super(RegisterState());

  void setLoading(bool isLoading) {
    state = state.copyWith(isLoading: isLoading);
  }

  Future<String?> getMemes() async {
    try {
      setLoading(true);
      var resp = await supabase.from('posts').select();
      print(resp);
      return null;
    } on AuthException catch (e) {
      return e.message;
    } finally {
      setLoading(false);
    }
  }

  void setEmail(String email) {
    state = state.copyWith(email: email);
  }

  void setPassword(String password) {
    state = state.copyWith(password: password);
  }
}
