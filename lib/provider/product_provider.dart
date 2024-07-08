import 'package:flutter/material.dart';
import 'package:irroba_test/services/irroba_api_service.dart';

/// Provedor de dados para manipulação de produtos.
class ProductProvider with ChangeNotifier {
  final IrrobaApiService
      _apiService; // Serviço de API para manipulação de produtos

  /// Construtor que recebe [IrrobaApiService] para inicialização.
  ProductProvider({required IrrobaApiService apiService})
      : _apiService = apiService;

  /// Método assíncrono para adicionar um novo produto.
  /// Retorna verdadeiro se a operação for bem-sucedida, falso caso contrário.
  Future<bool> addProduct({
    required String name,
    required int categoryId,
    required double price,
    required int stock,
  }) async {
    try {
      // Dados do produto a serem enviados para a API
      final productData = {
        'name': name,
        'category_id': categoryId,
        'price': price,
        'stock': stock,
      };

      // Chama o método na API para criar um novo produto
      await _apiService.createProduct(productData);

      return true; // Retorna verdadeiro indicando sucesso na criação do produto
    } catch (e) {
      // Captura e trata erros, imprimindo-os no console
      print('Error creating product: $e');
      return false; // Retorna falso indicando falha na criação do produto
    }
  }
}
