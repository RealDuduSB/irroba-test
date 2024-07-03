import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  final String _username = 'basecomm_api__erp';
  final String _password = 'YENTAGjPi9npyX79qBf0kR2FBGSjwBiJZ8JdJ8R';

  Future<String> authenticate() async {
    final response = await http.post(
      Uri.parse('https://www.irroba.com.br/dev/api/auth'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'username': _username, 'password': _password}),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['token'];
    } else {
      throw Exception('Failed to authenticate');
    }
  }
}
