import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:irroba_test/models/category.dart';
import 'package:irroba_test/models/order.dart';
import 'package:irroba_test/models/product.dart';
import 'package:irroba_test/utils/api_endpoints.dart';

/// Serviço para interagir com a API da Irroba.
class IrrobaApiService {
  // Credenciais de autenticação para a API
  static const String _username = 'basecomm_testemob';
  static const String _password = 'IJYjaeVMjCQ7fs8Fhqm5R1koSeESlSfBiYtXwXA';

  /// Obtém o token de autenticação da API.
  /// [username] e [password] são opcionais e substituem as credenciais padrão.
  Future<String?> getToken([String? username, String? password]) async {
    try {
      final response = await http.post(
        Uri.parse(API.GET_TOKEN),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'username': username ?? _username,
          'password': password ?? _password,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        String token = data['data']['authorization'];
        print('Token obtido: $token');
        return token;
      } else {
        throw Exception('Falha ao obter o token');
      }
    } catch (e) {
      throw Exception('Falha ao obter o token: $e');
    }
  }

  /// Busca a lista de produtos da API utilizando o token de autenticação.
  Future<List<Product>> fetchProducts() async {
    final token = await getToken(_username, _password);
    if (token == null) {
      throw Exception('Nenhum token obtido');
    }

    try {
      final response = await http.get(
        Uri.parse(API.GET_PRODUCTS),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        Iterable jsonResponse = jsonDecode(response.body);
        return jsonResponse
            .map((product) => Product.fromJson(product))
            .toList();
      } else {
        throw Exception('Falha ao carregar os produtos');
      }
    } catch (e) {
      throw Exception('Erro ao buscar os produtos: $e');
    }
  }

  /// Busca a lista de categorias da API.
  Future<List<Category>> getCategories() async {
    try {
      final response = await http.get(Uri.parse(API.GET_CATEGORY));

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

  /// Busca a lista inicial de pedidos da API.
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

  /// Cria um novo produto na API.
  /// [productData] é um mapa contendo os dados do produto.
  Future<void> createProduct(Map<String, dynamic> productData) async {
    final token = await getToken(_username, _password);
    if (token == null) {
      throw Exception('No token obtained');
    }

    final response = await http.post(
      Uri.parse(API.GET_PRODUCTS),
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
}
