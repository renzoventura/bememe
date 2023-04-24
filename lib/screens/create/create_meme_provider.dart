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
      Session? sessionUser = supabase.auth.currentSession;
      await supabase.from('posts').insert({
        'body': state.body,
        'user': sessionUser?.user.id,
      });

      return null;
    } on PostgrestException catch (e) {
      print(e.toString());
      return e.message;
    } catch (e) {
      print(e.toString());
      return e.toString();
    } finally {
      setLoading(false);
    }
  }

  void setBody(String body) {
    state = state.copyWith(body: body);
  }
}
