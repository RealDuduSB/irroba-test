import 'package:flutter/foundation.dart';
import 'package:irroba_test/services/irroba_api_service.dart';

class AuthProvider with ChangeNotifier {
  final ApiService apiService;
  bool _isAuthenticated = false;

  AuthProvider({required this.apiService});

  bool get isAuthenticated => _isAuthenticated;

  Future<void> login(String email, String password) async {
    String? token = await apiService.getToken(email, password);
    _isAuthenticated = token != null;
    notifyListeners(); // Notifica os ouvintes após a mudança no estado
  }
}
