import 'package:flutter/material.dart';
import 'custom_input.dart';

class LoginFields extends StatelessWidget {
  const LoginFields({
    super.key,
    required this.loginEmailController,
    required this.loginPasswordController,
  });
  final TextEditingController loginEmailController;
  final TextEditingController loginPasswordController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Column(
        children: [
          CustomInput(
            textHint: 'Email',
            inputController: loginEmailController,
          ),
          const SizedBox(height: 20),
          CustomInput(
            textHint: 'Password',
            inputController: loginPasswordController,
          ),
        ],
      ),
    );
  }
}
