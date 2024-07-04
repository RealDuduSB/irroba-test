import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:irroba_test/provider/auth_provider.dart';
import 'package:irroba_test/screens/login_screen.dart';
import 'package:provider/provider.dart';
import 'package:mockito/mockito.dart';

class MockAuthProvider extends Mock implements AuthProvider {}

void main() {
  late MockAuthProvider mockAuthProvider;

  setUp(() {
    mockAuthProvider = MockAuthProvider();
  });

  Widget createWidgetUnderTest() {
    return ChangeNotifierProvider<AuthProvider>(
      create: (_) => mockAuthProvider,
      child: MaterialApp(
        home: LoginScreen(),
      ),
    );
  }

  group('LoginScreen', () {
    testWidgets('should display username and password fields',
        (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.byType(TextField), findsNWidgets(2));
      expect(find.widgetWithText(TextField, 'Username'), findsOneWidget);
      expect(find.widgetWithText(TextField, 'Password'), findsOneWidget);
    });

    testWidgets('should display a login button', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.widgetWithText(ElevatedButton, 'Login'), findsOneWidget);
    });

    testWidgets('should call login method on login button tap',
        (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      final usernameField = find.widgetWithText(TextField, 'Username');
      final passwordField = find.widgetWithText(TextField, 'Password');
      final loginButton = find.widgetWithText(ElevatedButton, 'Login');

      await tester.enterText(usernameField, 'test_user');
      await tester.enterText(passwordField, 'test_password');
      await tester.tap(loginButton);

      verify(mockAuthProvider.login('test_user', 'test_password')).called(1);
    });
  });
}
