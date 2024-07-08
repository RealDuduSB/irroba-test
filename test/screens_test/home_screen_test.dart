import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:irroba_test/services/auth_service.dart';
import 'package:mockito/mockito.dart';
import 'package:irroba_test/provider/auth_provider.dart';

import 'mocks/mock_api_service.mocks.dart';

void main() {
  late AuthProvider authProvider;
  late MockIrrobaApiService mockApiService;

  setUp(() {
    mockApiService = MockIrrobaApiService();
    authProvider =
        AuthProvider(apiService: mockApiService, authService: AuthService());
  });

  group('AuthProvider', () {
    test('initially user should be null', () {
      expect(authProvider.user, isNull);
    });

    test('login should set user correctly', () async {
      const username = 'test_user';
      const password = 'test_password';
      const token = 'mocked_token';

      when(mockApiService.getToken(username, password))
          .thenAnswer((_) async => token);

      await authProvider.login(username, password);

      expect(authProvider.user, isNotNull);
      expect(authProvider.user!.username, username);
      expect(authProvider.user!.token, token);
    });

    test('logout should clear user', () async {
      const username = 'test_user';
      const password = 'test_password';
      const token = 'mocked_token';

      when(mockApiService.getToken(username, password))
          .thenAnswer((_) async => token);

      await authProvider.login(username, password);
      expect(authProvider.user, isNotNull);

      authProvider.logout();
      expect(authProvider.user, isNull);
    });
  });
}
