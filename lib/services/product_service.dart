import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:irroba_test/models/product.dart';

/// Um serviço para lidar com operações relacionadas a produtos através de uma API.
class ProductService {
  /// URL base da API.
  final String _baseUrl = 'https://www.irroba.com.br/dev/api';

  /// Token de autorização para acessar a API.
  final String _token;

  /// Construtor que requer um `token` de autorização.
  ProductService(this._token);

  /// Método para buscar uma lista de produtos da API.
  Future<List<Product>> fetchProducts() async {
    final response = await http.get(
      Uri.parse('$_baseUrl/products'),
      headers: {'Authorization': 'Bearer $_token'},
    );
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((product) => Product.fromJson(product)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
