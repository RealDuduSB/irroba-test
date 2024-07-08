import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:irroba_test/screens/init_screen.dart';
import 'package:irroba_test/services/irroba_api_service.dart';
import 'package:mockito/mockito.dart';

import 'mocks/mock_api_service.mocks.dart';

void main() {
  class MockIrrobaApiService extends Mock implements IrrobaApiService {}

  group('InitScreen Widget Test', () {
    late MockIrrobaApiService mockApiService;

    setUp(() {
      mockApiService = MockIrrobaApiService();
    });

    testWidgets('InitScreen builds correctly', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: InitScreen(),
      ));

      expect(find.byType(InitScreen), findsOneWidget);
    });

    testWidgets('InitScreen shows loading indicator', (WidgetTester tester) async {
      when(mockApiService.getToken()).thenAnswer((_) => Future.delayed(Duration(milliseconds: 200), () => null));

      await tester.pumpWidget(MaterialApp(
        home: InitScreen(),
      ));

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('InitScreen shows error message on token fetch failure', (WidgetTester tester) async {
      when(mockApiService.getToken()).thenThrow(Exception('Failed to fetch token'));
      await tester.pumpWidget(MaterialApp(
        home: InitScreen(),
      ));
      expect(find.text('Erro ao obter token: Failed to fetch token'), findsOneWidget);
    });

    testWidgets('InitScreen navigates to HomeScreen on successful token fetch', (WidgetTester tester) async {
      when(mockApiService.getToken()).thenAnswer((_) => Future.value('mock_token'));
      await tester.pumpWidget(MaterialApp(
        home: InitScreen(),
      ));
      await tester.pumpAndSettle();
      expect(find.byType(HomeScreen), findsOneWidget);
    });
  });
}
