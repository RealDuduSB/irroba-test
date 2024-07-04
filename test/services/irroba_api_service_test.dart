import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:irroba_test/models/product.dart';
import 'package:irroba_test/provider/product_provider.dart';
import 'package:irroba_test/screens/product_list_screen.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

// Crie uma classe de mock para o ProductProvider
class MockProductProvider extends Mock implements ProductProvider {}

void main() {
  late MockProductProvider mockProductProvider;

  setUp(() {
    mockProductProvider = MockProductProvider();
  });

  Widget createWidgetUnderTest() {
    return ChangeNotifierProvider<ProductProvider>(
      create: (_) => mockProductProvider,
      child: MaterialApp(
        home: ProductListScreen(),
      ),
    );
  }

  group('ProductListScreen', () {
    testWidgets('displays a list of products', (WidgetTester tester) async {
      // Configurando o mock para retornar uma lista de produtos
      final products = [
        Product(
          id: 1,
          name: 'Product 1',
          description: 'Description 1',
          price: 12.5,
        ),
        Product(
          id: 2,
          name: 'Product 2',
          description: 'Description 2',
          price: 12.5,
        ),
      ];

      when(mockProductProvider.products).thenReturn(products);

      await tester.pumpWidget(createWidgetUnderTest());

      // Verificando se a lista de produtos é exibida corretamente
      expect(find.text('Product 1'), findsOneWidget);
      expect(find.text('Product 2'), findsOneWidget);
    });

    testWidgets('displays the app bar title', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      // Verificando se o título da AppBar é exibido corretamente
      expect(find.text('Produtos'), findsOneWidget);
    });
  });
}
