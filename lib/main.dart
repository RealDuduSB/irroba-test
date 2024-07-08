import 'package:flutter/material.dart';
import 'package:irroba_test/provider/auth_provider.dart';
import 'package:irroba_test/provider/order_provider.dart';
import 'package:irroba_test/provider/product_provider.dart';
import 'package:irroba_test/screens/home_screen.dart';
import 'package:irroba_test/screens/init_screen.dart';
import 'package:irroba_test/screens/order_screen.dart';
import 'package:irroba_test/screens/product_registration_screen.dart';
import 'package:irroba_test/services/irroba_api_service.dart';
import 'package:provider/provider.dart';

void main() {
  // Instancia o serviço necessário para o aplicativo.
  IrrobaApiService apiService = IrrobaApiService();

  runApp(MyApp(apiService: apiService));
}

class MyApp extends StatelessWidget {
  final IrrobaApiService apiService;

  const MyApp({Key? key, required this.apiService}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<OrderProvider>(
          create: (_) => OrderProvider(apiService: apiService),
        ),
        ChangeNotifierProvider<ProductProvider>(
          create: (_) => ProductProvider(apiService: apiService),
        ),
      ],
      child: MaterialApp(
        title: 'Irroba',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/init',
        routes: {
          '/init': (context) => InitScreen(),
          '/home': (context) => const HomeScreen(),
          '/orderScreen': (context) => const OrderScreen(),
          '/productRegistration': (context) =>
              const ProductRegistrationScreen(),
        },
      ),
    );
  }
}
