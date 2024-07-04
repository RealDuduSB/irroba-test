import 'package:flutter/foundation.dart';
import 'package:irroba_test/services/irroba_api_service.dart';
import 'package:irroba_test/models/user.dart';

class AuthProvider with ChangeNotifier {
  final IrrobaApiService apiService;

  User? _user;

  AuthProvider({required this.apiService});

  User? get user => _user;

  Future<void> login(String username, String password) async {
    final token = await apiService.getToken(username, password);
    if (token != null) {
      _user = User(username: username, token: token);
      notifyListeners();
    }
  }

  void logout() {
    _user = null;
    notifyListeners();
  }

  bool get isAuthenticated => _user != null;
}
