import 'package:flutter/material.dart';
import 'package:irroba_test/provider/auth_provider.dart';
import 'package:irroba_test/widgets/login_widgets.dart';
import 'package:provider/provider.dart'; // Importando os widgets da nova estrutura

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            EmailField(controller: _emailController),
            PasswordField(controller: _passwordController),
            const SizedBox(height: 20),
            LoginButton(
              onPressed: () {
                Provider.of<AuthProvider>(context, listen: false).login(
                  _emailController.text,
                  _passwordController.text,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
