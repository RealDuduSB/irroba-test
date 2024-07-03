import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:irroba_test/models/product.dart';

class ProductService {
  final String _baseUrl = 'https://www.irroba.com.br/dev/api';
  final String _token;

  ProductService(this._token);

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
