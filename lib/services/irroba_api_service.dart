// lib/services/api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://api.irroba.com.br/v1';

  Future<String?> getToken(String username, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/getToken'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'username': username, 'password': password}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['token'];
    } else {
      return null;
    }
  }

  fetchProducts() {}
}
