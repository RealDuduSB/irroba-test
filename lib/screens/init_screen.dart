import 'package:flutter/material.dart';
import 'package:irroba_test/widgets/init_screen_widgets.dart';

class InitScreen extends StatelessWidget {
  const InitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.red,
      body: SafeArea(
        child: InitScreenContent(),
      ),
    );
  }
}
