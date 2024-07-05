import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:irroba_test/screens/categories_screen.dart';
import 'package:irroba_test/services/irroba_category_service.dart';
import 'package:irroba_test/models/category.dart';
import 'package:irroba_test/widgets/categories_widget.dart';
import 'package:mockito/mockito.dart';

// Mock do serviço de categorias
class MockCategoryService extends Mock implements IrrobaCategoryService {}

void main() {
  late MockCategoryService mockCategoryService;
  late CategoriesScreen categoriesScreen;

  setUp(() {
    mockCategoryService = MockCategoryService();
    categoriesScreen = CategoriesScreen(categoryService: mockCategoryService);
  });

  testWidgets('CategoriesScreen loading indicator',
      (WidgetTester tester) async {
    when(mockCategoryService.fetchCategories(
            sort: anyNamed('sort'), order: anyNamed('order')))
        .thenAnswer((_) async => []);

    await tester.pumpWidget(MaterialApp(home: categoriesScreen));

    // Verifica se o indicador de carregamento está sendo exibido
    expect(find.byType(LoadingIndicator), findsOneWidget);

    // Simula o retorno vazio do serviço de categorias
    await tester.pump();

    // Verifica se o indicador de carregamento desaparece e a mensagem de nenhum dado encontrado é exibida
    expect(find.byType(NoDataDisplay), findsOneWidget);
  });

  testWidgets('CategoriesScreen loaded categories',
      (WidgetTester tester) async {
    // Cria uma lista de categorias simulada
    List<Category> mockCategories = [
      Category(id: 1, name: 'Category 1'),
      Category(id: 2, name: 'Category 2'),
    ];

    when(mockCategoryService.fetchCategories(
            sort: anyNamed('sort'), order: anyNamed('order')))
        .thenAnswer((_) async => mockCategories);

    await tester.pumpWidget(MaterialApp(home: categoriesScreen));

    // Verifica se o indicador de carregamento não está mais sendo exibido
    expect(find.byType(LoadingIndicator), findsNothing);

    // Verifica se a lista de categorias é exibida corretamente
    expect(find.byType(CategoryList), findsOneWidget);

    // Verifica se o número correto de categorias é exibido na lista
    expect(find.byType(CategoryItem), findsNWidgets(mockCategories.length));

    // Simula o clique em uma categoria (opcional, dependendo da implementação)
    // await tester.tap(find.text('Category 1'));
    // await tester.pumpAndSettle();
    // Verifica se a navegação para os detalhes da categoria ocorre corretamente
    // expect(find.text('Detalhes da Categoria 1'), findsOneWidget);
  });

  // Adicione mais testes conforme necessário para cobrir outros casos de uso e comportamentos da tela
}
