import 'package:flutter/material.dart';
import 'package:irroba_test/provider/auth_provider.dart';
import 'package:irroba_test/screens/home_screen.dart';
import 'package:irroba_test/screens/init_screen.dart';
import 'package:irroba_test/screens/login_screen.dart';
import 'package:irroba_test/services/irroba_api_service.dart';
import 'package:provider/provider.dart';

void main() {
  ApiService apiService = ApiService(); // Instanciando ApiService aqui

  runApp(MyApp(apiService: apiService));
}

class MyApp extends StatelessWidget {
  final ApiService apiService;

  const MyApp({super.key, required this.apiService});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (_) => AuthProvider(
            apiService: apiService, // Passando a instância de ApiService aqui
          ),
        ),
      ],
      child: const MaterialApp(
        home: InitScreen(),
        //Consumer<AuthProvider>(
        //  builder: (ctx, auth, _) =>
        //      auth.isAuthenticated ? const InitScreen() : LoginScreen(),
        //),
      ),
    );
  }
}
