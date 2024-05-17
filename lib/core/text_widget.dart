import 'package:flutter/material.dart';

class TextForm extends StatefulWidget {
  const TextForm({
    required this.hintText,
    required this.text,
    this.validate,
    this.textEditingController,
    this.suffix,
    this.obscureText,
    super.key,
  });
  final String text;
  final String hintText;
  final String? Function(String? value)? validate;
  final TextEditingController? textEditingController;
  final Widget? suffix;
  final bool? obscureText;

  @override
  State<TextForm> createState() => _TextFormState();
}

class _TextFormState extends State<TextForm> {
  FocusNode myFocusNode =  FocusNode();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      controller: widget.textEditingController,
      validator: (value) => widget.validate!(value),
      obscureText: widget.obscureText ?? false,
      decoration: InputDecoration(
        labelStyle:
            TextStyle(color: myFocusNode.hasFocus ? Colors.grey : Colors.red),
        suffix: widget.suffix,
        hintText: widget.hintText,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(32.0),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2.0),
          borderRadius: BorderRadius.all(
            Radius.circular(32.0),
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 1.0),
          borderRadius: BorderRadius.all(
            Radius.circular(32.0),
          ),
        ),
        label: Text(widget.text),
      ),
    );
  }
}
