import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:irroba_test/models/product.dart';

class IrrobaApiService {
  static const String baseUrl = 'https://api.irroba.com.br/v1';
  static const String getTokenUrl = '$baseUrl/getToken';

  Future<String?> getToken(String username, String password) async {
    try {
      final response = await http.post(
        Uri.parse(getTokenUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'username': username, 'password': password}),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        String? authorizationToken = data['data']['authorization'];
        return authorizationToken;
      } else {
        throw Exception('Failed to get token');
      }
    } catch (e) {
      throw Exception('Failed to get token: $e');
    }
  }

  Future<List<Product>> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/product'), headers: {
        'Authorization':
            'Bearer YOUR_TOKEN_HERE', // substitua pelo token correto
        'Content-Type': 'application/json',
      });

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body)['data'];
        return data
            .map((productJson) => Product.fromJson(productJson))
            .toList();
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      throw Exception('Failed to load products: $e');
    }
  }

  Future<List<Product>> fetchProductStocks(List<Product> products) async {
    try {
      final List<Future<Product>> futures = products.map((product) async {
        final response = await http.get(
          Uri.parse('$baseUrl/product/${product.id}/stock'),
          headers: {
            'Authorization': 'Bearer YOUR_TOKEN_HERE',
            'Content-Type': 'application/json',
          },
        );

        if (response.statusCode == 200) {
          Map<String, dynamic> data = jsonDecode(response.body)['data'];
          int stockQuantity = data['stock_quantity'];
          return product.copyWith(stock: stockQuantity);
        } else {
          throw Exception('Failed to load stock for product ${product.id}');
        }
      }).toList();

      return Future.wait(futures);
    } catch (e) {
      throw Exception('Failed to load product stocks: $e');
    }
  }
}
