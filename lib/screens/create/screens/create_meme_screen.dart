import 'package:bememe/components/primary_button.dart';
import 'package:bememe/utils/show_popup.dart';
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
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 64),
              TextFormField(
                controller: controller,
                decoration: const InputDecoration(
                  hintText: 'Enter some text',
                ),
                onChanged: provider.setBody,
              ),
              state.isLoading
                  ? const CircularProgressIndicator()
                  : PrimaryButton(
                      onTap: () {
                        provider.createPost(controller.text).then((value) {
                          if (value == null) {
                            showPopup("Post created successfully");
                            context.pop();
                          } else {
                            showPopup(value);
                          }
                        });
                      },
                      text: 'Submit'),
            ],
          ),
        ),
      ),
    );
  }
}
