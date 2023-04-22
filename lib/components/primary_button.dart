import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({Key? key, required this.onTap, required this.text}) : super(key: key);

  final Function onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          onTap();
        },
        child: Text(text.toUpperCase()),
      ),
    );
  }
}
