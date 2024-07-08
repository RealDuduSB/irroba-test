import 'package:flutter/material.dart';
import 'package:irroba_test/provider/auth_provider.dart';
import 'package:provider/provider.dart';

/// Widget para entrada de email.
class EmailField extends StatelessWidget {
  final TextEditingController controller;

  const EmailField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: const InputDecoration(labelText: 'Email'),
    );
  }
}

/// Widget para entrada de senha.
class PasswordField extends StatelessWidget {
  final TextEditingController controller;

  const PasswordField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: const InputDecoration(labelText: 'Password'),
      obscureText: true,
    );
  }
}

/// Botão de login.
class LoginButton extends StatelessWidget {
  final Function onPressed;

  const LoginButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Provider.of<AuthProvider>(context, listen: false).login(
          context.read<TextEditingController>().text,
          context.read<TextEditingController>().text,
        );
      },
      child: const Text('Login'),
    );
  }
}
