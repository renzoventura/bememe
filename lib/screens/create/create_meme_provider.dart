import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bememe/main.dart';
import 'package:bememe/screens/create/create_meme_state.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final createMemeProvider = StateNotifierProvider<CreateMemeProvider, CreateMemeState>((ref) {
  return CreateMemeProvider();
});

class CreateMemeProvider extends StateNotifier<CreateMemeState> {
  CreateMemeProvider() : super(CreateMemeState());

  void setLoading(bool isLoading) {
    state = state.copyWith(isLoading: isLoading);
  }

  Future<String?> createPost(String body) async {
    try {
      setLoading(true);
      //Should extract this in another file - service/data layer
      Session? sessionUser = supabase.auth.currentSession;
      await supabase.from('Posts').insert({'body': state.body}).eq("id", sessionUser?.user.id);

      return null;
    } catch (e) {
      print(e.toString());
      print('Something went wrong');
      return e.toString();
    } finally {
      setLoading(false);
    }
  }

  void setBody(String body) {
    state = state.copyWith(body: body);
  }
}
