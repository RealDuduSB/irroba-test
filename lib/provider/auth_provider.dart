import 'package:flutter/foundation.dart';
import 'package:irroba_test/models/user.dart';

/// Classe provedora responsável por gerenciar o estado de autenticação do usuário.
class AuthProvider with ChangeNotifier {
  User? _user; // Usuário autenticado.

  /// Retorna o usuário atualmente autenticado.
  User? get user => _user;

  /// Realiza o login do usuário com as credenciais fornecidas.
  ///
  /// Simula um login simples com usuário e senha.
  Future<void> login(String username, String password) async {
    // Simulando a lógica de login (pode ser substituída pela lógica real de autenticação)
    if (username == 'test' && password == 'password') {
      _user =
          User(username: username, token: 'mocked_token'); // Usuário simulado
      notifyListeners(); // Notifica os ouvintes sobre a mudança no estado de autenticação.
    } else {
      throw Exception(
          'Credenciais inválidas'); // Simulando erro de autenticação
    }
  }

  /// Desconecta o usuário, limpando todas as informações de autenticação.
  void logout() {
    _user = null; // Limpa as informações do usuário.
    notifyListeners(); // Notifica os ouvintes sobre a mudança no estado de autenticação.
  }

  /// Indica se há um usuário autenticado atualmente.
  bool get isAuthenticated => _user != null;
}
