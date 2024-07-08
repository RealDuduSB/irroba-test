import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:irroba_test/screens/categories_screen.dart';
import 'package:irroba_test/services/irroba_category_service.dart';
import 'package:irroba_test/models/category.dart';
import 'package:irroba_test/widgets/category_list.dart';
import 'package:irroba_test/widgets/loading_indicator.dart';
import 'package:irroba_test/widgets/no_data_display.dart';
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
    // Simula que o serviço de categorias retorna uma lista vazia inicialmente
    when(mockCategoryService.fetchCategories(
            sort: anyNamed('sort'), order: anyNamed('order')))
        .thenAnswer((_) async => []);

    await tester.pumpWidget(MaterialApp(home: categoriesScreen));

    // Verifica se o indicador de carregamento é exibido inicialmente
    expect(find.byType(LoadingIndicator), findsOneWidget);

    // Aguarda a conclusão do carregamento
    await tester.pump();

    // Verifica se o indicador de carregamento desaparece e a mensagem de nenhum dado encontrado é exibida
    expect(find.byType(LoadingIndicator), findsNothing);
    expect(find.byType(NoDataDisplay), findsOneWidget);
  });

  testWidgets('CategoriesScreen loaded categories',
      (WidgetTester tester) async {
    // Lista simulada de categorias
    List<Category> mockCategories = [
      Category(
        id: 1,
        name: 'Category 1',
        categoryId: 0,
        image: '',
        metaTitle: '',
        metaDescription: '',
        description: '',
        dateAdded: '',
        status: '',
        sortOrder: 0,
      ),
      Category(
        id: 2,
        name: 'Category 2',
        categoryId: 0,
        image: '',
        metaTitle: '',
        metaDescription: '',
        description: '',
        dateAdded: '',
        status: '',
        sortOrder: 0,
      ),
    ];

    // Simula que o serviço de categorias retorna uma lista de categorias
    when(mockCategoryService.fetchCategories(
            sort: anyNamed('sort'), order: anyNamed('order')))
        .thenAnswer((_) async => mockCategories);

    await tester.pumpWidget(MaterialApp(home: categoriesScreen));

    // Verifica se o indicador de carregamento não está mais sendo exibido
    expect(find.byType(LoadingIndicator), findsNothing);

    // Verifica se a lista de categorias está sendo exibida
    expect(find.byType(CategoryList), findsOneWidget);

    // Aqui você pode adicionar mais verificações conforme necessário
  });
}
