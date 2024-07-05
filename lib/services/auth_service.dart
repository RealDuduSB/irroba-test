import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  static const String _username = 'basecomm_testemob';
  static const String _password = 'IJYjaeVMjCQ7fs8Fhqm5R1koSeESlSfBiYtXwXA';

  Future<String> getToken() async {
    try {
      final response = await http.post(
        Uri.parse('https://api.irroba.com.br/v1/getToken'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'username': _username, 'password': _password}),
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body)['data']['authorization'];
      } else {
        throw Exception('Failed to get token');
      }
    } catch (e) {
      throw Exception('Failed to get token: $e');
    }
  }
}
