import 'package:flutter/material.dart';

class TextForm extends StatelessWidget {
  const TextForm({
    Key? key,
    required this.label,
    required this.controller,
    required this.onChange,
  }) : super(key: key);
  final String label;
  final TextEditingController controller;
  final Function(String) onChange;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        label: Text(label),
      ),
      onChanged: onChange,
    );
  }
}
