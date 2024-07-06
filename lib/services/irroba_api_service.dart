import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:irroba_test/models/category.dart';
import 'package:irroba_test/models/order.dart';
import 'package:irroba_test/models/product.dart';
import 'package:irroba_test/utils/api_endpoints.dart';

class IrrobaApiService {
  static const String _username = 'basecomm_testemob';
  static const String _password = 'IJYjaeVMjCQ7fs8Fhqm5R1koSeESlSfBiYtXwXA';

  Future<String?> getToken([String? username, String? password]) async {
    try {
      final response = await http.post(
        Uri.parse('${API.BASE_URL}/getToken'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'username': username ?? _username,
          'password': password ?? _password
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['data']['authorization'];
      } else {
        throw Exception('Failed to get token');
      }
    } catch (e) {
      throw Exception('Failed to get token: $e');
    }
  }

  Future<List<Product>> fetchProducts() async {
    final token = await getToken(_username, _password);
    if (token == null) {
      throw Exception('No token obtained');
    }

    final response = await http.get(
      Uri.parse('${API.GET_PRODUCTS}'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      Iterable jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((product) => Product.fromJson(product)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<List<Product>> fetchProductStocks() async {
    final token = await getToken(_username, _password);
    if (token == null) {
      throw Exception('No token obtained');
    }

    final response = await http.get(
      Uri.parse(API.GET_PRODUCTS),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      Iterable jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((product) {
        return Product.fromJson(product);
      }).toList();
    } else {
      throw Exception('Failed to load product stocks');
    }
  }

  Future<List<Category>> getCategories() async {
    try {
      final response = await http.get(Uri.parse('$API.BASE_URL/category'));

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        List<Category> categories = (jsonData['data'] as List)
            .map((item) => Category.fromJson(item))
            .toList();
        return categories;
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      throw Exception('Error fetching categories: $e');
    }
  }

  Future<List<OrderModel>> getOrdersInitData() async {
    try {
      final response = await http.get(Uri.parse(API.INIT_ORDER_DATA));

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        List<OrderModel> orders = (jsonData['data'] as List)
            .map((item) => OrderModel.fromJson(item))
            .toList();
        return orders;
      } else {
        throw Exception('Failed to load orders');
      }
    } catch (e) {
      throw Exception('Error fetching orders: $e');
    }
  }

  Future<void> createProduct(Map<String, dynamic> productData) async {
    final token = await getToken(_username, _password);
    if (token == null) {
      throw Exception('No token obtained');
    }

    final response = await http.post(
      Uri.parse('${API.BASE_URL}/products'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(productData),
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode != 200) {
      throw Exception('Failed to create product');
    }
  }

  // Outros métodos conforme necessário
}
