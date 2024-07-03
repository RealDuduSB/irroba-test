import 'package:flutter_test/flutter_test.dart';
import 'package:irroba_test/provider/auth_provider.dart';
import 'package:irroba_test/services/irroba_api_service.dart';
import 'package:mockito/mockito.dart';

class MockApiService extends Mock implements ApiService {}

void main() {
  group('AuthProvider', () {
    test('login sets isAuthenticated to true on successful login', () async {
      final mockApiService = MockApiService();
      final authProvider = AuthProvider(apiService: mockApiService);

      when(mockApiService.getToken(any, any))
          .thenAnswer((_) async => 'fake-token');

      await authProvider.login('email@example.com', 'password');

      expect(authProvider.isAuthenticated, true);
    });

    test('login does not set isAuthenticated to true on failed login',
        () async {
      final mockApiService = MockApiService();
      final authProvider = AuthProvider(apiService: mockApiService);

      when(mockApiService.getToken(any, any)).thenAnswer((_) async => null);

      await authProvider.login('email@example.com', 'wrong-password');

      expect(authProvider.isAuthenticated, false);
    });
  });
}
