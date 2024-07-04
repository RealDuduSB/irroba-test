import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:irroba_test/provider/auth_provider.dart';

import 'mocks/mock_api_service.mocks.dart';

void main() {
  late AuthProvider authProvider;
  late MockIrrobaApiService
      mockApiService; // Certifique-se de usar o mock correto aqui

  setUp(() {
    mockApiService = MockIrrobaApiService(); // Use o mock gerado aqui
    authProvider = AuthProvider(apiService: mockApiService);
  });

  group('AuthProvider', () {
    test('initially user should be null', () {
      expect(authProvider.user, isNull);
    });

    test('login should set user correctly', () async {
      final username = 'test_user';
      final password = 'test_password';
      final token = 'mocked_token';

      when(mockApiService.getToken(username, password))
          .thenAnswer((_) async => token);

      await authProvider.login(username, password);

      expect(authProvider.user, isNotNull);
      expect(authProvider.user!.username, username);
      expect(authProvider.user!.token, token);
    });

    test('logout should clear user', () async {
      final username = 'test_user';
      final password = 'test_password';
      final token = 'mocked_token';

      when(mockApiService.getToken(username, password))
          .thenAnswer((_) async => token);

      await authProvider.login(username, password);
      expect(authProvider.user, isNotNull);

      authProvider.logout();
      expect(authProvider.user, isNull);
    });
  });
}
