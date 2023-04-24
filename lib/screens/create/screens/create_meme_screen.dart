import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:bememe/screens/create/create_meme_provider.dart';

class CreateMemeScreen extends ConsumerStatefulWidget {
  static String path = "create-meme";

  const CreateMemeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<CreateMemeScreen> createState() => _CreateMindSheetState();
}

class _CreateMindSheetState extends ConsumerState<CreateMemeScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(createMemeProvider.notifier);
    final state = ref.watch(createMemeProvider);
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 64),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  icon: const Icon(
                    Icons.close,
                  ),
                ),
              ],
            ),
            TextFormField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: 'Enter some text',
              ),
            ),
            state.isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () {
                      provider.createPost(controller.text);
                      // Navigator.of(context).pop(controller.text);
                    },
                    child: const Text('Submit'),
                  ),
          ],
        ),
      ),
    );
  }
}
