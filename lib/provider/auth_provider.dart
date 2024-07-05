import 'package:flutter/foundation.dart';
import 'package:irroba_test/services/auth_service.dart';
import 'package:irroba_test/services/irroba_api_service.dart';
import 'package:irroba_test/models/user.dart';

/// Classe provedora responsável por gerenciar o estado de autenticação do usuário e suas ações.
///
/// Integra-se com o serviço da API da Irroba para operações de autenticação.
class AuthProvider with ChangeNotifier {
  final IrrobaApiService
      apiService; // Serviço para interação com a API da Irroba.

  User? _user; // Usuário autenticado.

  /// Construtor da classe AuthProvider.
  ///
  /// [apiService] é necessário para interagir com a API da Irroba.
  AuthProvider({required this.apiService});

  /// Retorna o usuário atualmente autenticado.
  User? get user => _user;

  /// Realiza o login do usuário com as credenciais fornecidas.
  ///
  /// Atualiza [_user] com o token de autenticação se o login for bem-sucedido.
  Future<void> login(String username, String password) async {
    final token = await apiService.getToken(username, password);
    if (token != null) {
      _user = User(
          username: username,
          token: token); // Atualiza o usuário com o token recebido.
      notifyListeners(); // Notifica os ouvintes sobre a mudança no estado de autenticação.
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
