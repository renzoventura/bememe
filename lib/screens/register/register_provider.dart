import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bememe/main.dart';
import 'package:bememe/screens/register/register_state.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final registerProvider = StateNotifierProvider<RegisterProvider, RegisterState>((ref) {
  return RegisterProvider();
});

class RegisterProvider extends StateNotifier<RegisterState> {
  RegisterProvider() : super(RegisterState());

  void setLoading(bool isLoading) {
    state = state.copyWith(isLoading: isLoading);
  }

  Future<String?> register() async {
    try {
      setLoading(true);
      //Should extract this in another file - service/data layer
      await supabase.auth.signUp(email: state.email, password: state.password);
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
