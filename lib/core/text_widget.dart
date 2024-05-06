import 'package:flutter/material.dart';

class TextForm extends StatelessWidget {
  const TextForm({
    required this.hintText,
    required this.text,
    super.key,
  });
  final String text;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
        // labelStyle: const TextStyle(color: Colors.red),
        
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(32.0),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 1.0),
          borderRadius: BorderRadius.all(
            Radius.circular(32.0),
          ),
        ),
        label: Text(text),
      ),
    );
  }
}
