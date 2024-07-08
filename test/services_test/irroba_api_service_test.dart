import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:irroba_test/services/irroba_api_service.dart';
import 'package:mockito/mockito.dart';

class MockClient extends Mock implements http.Client {}

void main() {
  late IrrobaApiService apiService;
  late MockClient mockClient;

  setUp(() {
    mockClient = MockClient();
    apiService = IrrobaApiService();
    apiService.client = mockClient; // Configura o cliente mockado no serviço
  });

  group('IrrobaApiService', () {
    test('getToken - success', () async {
      final mockToken = 'mocked_token';
      final mockResponse = jsonEncode({
        'data': {'authorization': mockToken}
      });

      when(mockClient.post(any,
              headers: anyNamed('headers'), body: anyNamed('body')))
          .thenAnswer((_) async => http.Response(mockResponse, 200));

      final token = await apiService.getToken();

      expect(token, mockToken);
    });

    test('getToken - failure', () async {
      when(mockClient.post(any,
              headers: anyNamed('headers'), body: anyNamed('body')))
          .thenThrow(Exception('Failed to get token'));

      expect(() => apiService.getToken(), throwsException);
    });

    test('fetchProducts - success', () async {
      final mockProducts = [
        {'id': 1, 'name': 'Product 1'},
        {'id': 2, 'name': 'Product 2'}
      ];
      final mockResponse = jsonEncode(mockProducts);

      // Simula uma resposta bem-sucedida ao buscar produtos
      when(mockClient.get(any, headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response(mockResponse, 200));

      final products = await apiService.fetchProducts();

      expect(products.length, mockProducts.length);
      expect(products[0]['id'], mockProducts[0]['id']);
      expect(products[1]['name'], mockProducts[1]['name']);
    });

    test('fetchProducts - failure', () async {
      // Simula uma falha ao buscar produtos
      when(mockClient.get(any, headers: anyNamed('headers')))
          .thenThrow(Exception('Failed to load products'));

      expect(() => apiService.fetchProducts(), throwsException);
    });
  });
}
