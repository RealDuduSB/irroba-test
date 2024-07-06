import 'package:flutter/material.dart';
import 'package:irroba_test/provider/auth_provider.dart';
import 'package:irroba_test/provider/order_provider.dart';
import 'package:irroba_test/provider/product_provider.dart';
import 'package:irroba_test/screens/home_screen.dart';
import 'package:irroba_test/screens/init_screen.dart';
import 'package:irroba_test/screens/order_screen.dart';
import 'package:irroba_test/screens/product_registration_screen.dart';
import 'package:irroba_test/screens/product_stock_screen.dart'; // Importe a nova tela
import 'package:irroba_test/services/auth_service.dart';
import 'package:irroba_test/services/irroba_api_service.dart';
import 'package:provider/provider.dart';

void main() {
  IrrobaApiService apiService = IrrobaApiService();
  AuthService authService = AuthService();

  runApp(MyApp(apiService: apiService, authService: authService));
}

class MyApp extends StatelessWidget {
  final IrrobaApiService apiService;
  final AuthService authService;

  const MyApp({Key? key, required this.apiService, required this.authService})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (_) => AuthProvider(
            authService: authService,
            apiService: apiService,
          ),
        ),
        ChangeNotifierProvider<OrderProvider>(
          create: (_) => OrderProvider(apiService: apiService),
        ),
        ChangeNotifierProvider<ProductProvider>(
          create: (_) => ProductProvider(
              apiService: apiService), // Adicione o ProductProvider aqui
        ),
      ],
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => Consumer<AuthProvider>(
                builder: (context, authProvider, _) {
                  bool isAuthenticated = authProvider.isAuthenticated;
                  return isAuthenticated
                      ? const HomeScreen()
                      : const InitScreen();
                },
              ),
          '/home': (context) => const HomeScreen(),
          '/productStock': (context) => const ProductStockScreen(),
          '/orderScreen': (context) => const OrderScreen(),
          '/productRegistration': (context) =>
              const ProductRegistrationScreen(),
        },
      ),
    );
  }
}
