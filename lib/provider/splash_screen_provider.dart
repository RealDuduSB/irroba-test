import 'package:flutter/foundation.dart';

/// Classe provedora responsável por gerenciar o estado de carregamento da tela inicial.
///
/// Esta classe notifica os ouvintes sobre mudanças no estado de carregamento.
class SplashScreenProvider with ChangeNotifier {
  bool _isLoading = true; // Indica se a tela de splash está carregando

  /// Retorna verdadeiro se a tela de splash estiver carregando, falso caso contrário.
  bool get isLoading => _isLoading;

  /// Define o estado de carregamento da tela de splash e notifica os ouvintes sobre a mudança.
  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners(); // Notifica os ouvintes sobre a mudança no estado de carregamento
  }
}
