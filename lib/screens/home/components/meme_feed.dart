import 'package:bememe/screens/home/meme_feed_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MemeFeed extends ConsumerWidget {
  const MemeFeed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(memeFeedProvider);


    return ListView.builder(
      shrinkWrap: true,
      itemCount: state.memes.length,
      itemBuilder: (context, index) {
        print(state.memes[index]);
        return ListTile(
          title: Text(state.memes[index]['body']),
        );
      },
    );
  }
}
