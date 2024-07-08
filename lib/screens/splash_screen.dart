import 'package:flutter/material.dart';

/// Uma tela de splash básica que exibe uma imagem da logo da Irroba centralizada.
class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.red, // Define o fundo vermelho para a tela de splash do app
      body: Center(
        child: Image.asset(
            'assets/splash.png'), // Exibe uma imagem centralizada a partir do caminho 'assets/splash.png'
      ),
    );
  }
}
