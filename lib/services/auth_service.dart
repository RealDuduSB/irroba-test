import 'dart:convert';
import 'package:http/http.dart' as http;

/// Um serviço para autenticar e obter um token de acesso através da API da Irroba.
class AuthService {
  /// Nome de usuário para autenticação.
  static const String _username = 'basecomm_testemob';

  /// Senha para autenticação.
  static const String _password = 'IJYjaeVMjCQ7fs8Fhqm5R1koSeESlSfBiYtXwXA';

  /// Método para obter um token de acesso através da API da Irroba.
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
        throw Exception('Falha ao obter o token');
      }
    } catch (e) {
      throw Exception('Falha ao obter o token: $e');
    }
  }
}
