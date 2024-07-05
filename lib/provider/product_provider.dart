import 'package:flutter/material.dart';
import 'package:irroba_test/models/product.dart';
import 'package:irroba_test/services/irroba_api_service.dart';

/// Classe provedora responsável por gerenciar o estado e operações relacionadas a produtos.
///
/// Integra-se com o serviço da API da Irroba para operações de busca e atualização de produtos.
class ProductProvider with ChangeNotifier {
  final IrrobaApiService apiService;
  List<Product> _products = []; // Lista de produtos

  /// Construtor da classe ProductProvider.
  ///
  /// [apiService] é necessário para interagir com a API da Irroba.
  ProductProvider({required this.apiService});

  /// Retorna a lista atual de produtos.
  List<Product> get products => _products;

  /// Define a lista de produtos para o valor fornecido e notifica os ouvintes sobre a mudança.
  void setProducts(List<Product> products) {
    _products = products;
    notifyListeners();
  }

  /// Busca e atualiza a lista de produtos a partir da API da Irroba.
  Future<void> fetchAndSetProducts() async {
    try {
      List<Product> fetchedProducts =
          await apiService.fetchProducts(); // Busca produtos da API
      List<Product> productsWithStock = await apiService.fetchProductStocks(
          fetchedProducts); // Busca estoques de produtos da API

      _products = productsWithStock; // Atualiza a lista de produtos com estoque
      notifyListeners(); // Notifica os ouvintes sobre a mudança na lista de produtos
    } catch (e) {
      throw Exception(
          'Falha ao buscar produtos: $e'); // Lança uma exceção em caso de erro na busca de produtos
    }
  }
}
