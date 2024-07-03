import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:irroba_test/screens/home_screen.dart';
import 'package:irroba_test/models/product.dart';
import 'package:provider/provider.dart';
import 'package:mockito/mockito.dart';

import '../providers/auth_provider_test.dart';

void main() {
  testWidgets('HomeScreen displays products from ApiService',
      (WidgetTester tester) async {
    // Crie um mock de ApiService
    MockApiService mockApiService = MockApiService();

    // Simule o retorno de produtos quando fetchProducts() for chamado
    when(mockApiService.fetchProducts()).thenAnswer((_) async => [
          Product(id: 1, name: 'Produto 1', price: 10.0),
          Product(id: 2, name: 'Produto 2', price: 20.0),
        ]);

    // Construa o widget da HomeScreen
    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider.value(
          value: mockApiService,
          child: HomeScreen(),
        ),
      ),
    );

    // Verifique se o título da AppBar está correto
    expect(find.text('Lista de Produtos'), findsOneWidget);

    // Verifique se os produtos estão sendo exibidos corretamente na lista
    expect(find.text('Produto 1'), findsOneWidget);
    expect(find.text('R\$ 10.00'), findsOneWidget);

    expect(find.text('Produto 2'), findsOneWidget);
    expect(find.text('R\$ 20.00'), findsOneWidget);
  });
}
