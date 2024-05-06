import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key, required this.logoFontSize});
  final double logoFontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      'ANTUVN',
      style: TextStyle(
          fontSize: logoFontSize,
          letterSpacing: -5.0,
          color: const Color.fromARGB(255, 29, 154, 33),
          fontWeight: FontWeight.bold),
    );
  }
}
