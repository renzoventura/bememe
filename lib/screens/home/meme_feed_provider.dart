import 'package:bememe/screens/home/meme_feed_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bememe/main.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final memeFeedProvider = StateNotifierProvider<MemeFeedProvider, MemeFeedState>((ref) => MemeFeedProvider());

class MemeFeedProvider extends StateNotifier<MemeFeedState> {
  MemeFeedProvider() : super(MemeFeedState(memes: []));

  void setLoading(bool isLoading) {
    state = state.copyWith(isLoading: isLoading);
  }

  void addMoreMemes(List memes) {
    // List newMemes = state.memes.toList().addAll(memes);
    // state = state.copyWith(memes: state.memes.addAll(memes));
  }

  Future<String?> getMemes() async {
    try {
      setLoading(true);
      dynamic resp = await supabase.from('posts').select();
      print(resp);
      List<dynamic> test = resp.toList();
      test.forEach((e) => print(e));
      state = state.copyWith(memes: test);

      print(resp);
      return null;
    } on AuthException catch (e) {
      return e.message;
    } finally {
      setLoading(false);
    }
  }
}
