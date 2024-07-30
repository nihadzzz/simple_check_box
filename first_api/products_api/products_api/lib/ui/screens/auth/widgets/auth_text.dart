import 'package:flutter/material.dart';

class AuthText extends StatelessWidget {
  const AuthText({
    super.key,
    required this.authText,
  });
  final String authText;

  @override
  Widget build(BuildContext context) {
    return Text(
      authText,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }
}
