import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:irroba_test/provider/auth_provider.dart';
import 'package:irroba_test/screens/login_screen.dart';
import 'package:irroba_test/services/irroba_api_service.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('Login Screen has a login button', (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider<AuthProvider>(
        create: (_) => AuthProvider(),
        child: MaterialApp(home: LoginScreen()),
      ),
    );

    expect(find.text('Login'), findsOneWidget);
    expect(find.byType(TextField), findsNWidgets(2));
  });

  testWidgets('Tapping login button triggers login',
      (WidgetTester tester) async {
    final authProvider = AuthProvider(apiService: apiService);

    await tester.pumpWidget(
      ChangeNotifierProvider<AuthProvider>.value(
        value: authProvider,
        child: MaterialApp(home: LoginScreen()),
      ),
    );

    await tester.enterText(find.byType(TextField).at(0), 'email@example.com');
    await tester.enterText(find.byType(TextField).at(1), 'password');
    await tester.tap(find.text('Login'));
    await tester.pump();

    expect(authProvider.isAuthenticated, false);

    await tester.pump(Duration(seconds: 2)); // Simulate API call delay
    expect(authProvider.isAuthenticated, true);
  });
}
