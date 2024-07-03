import 'package:flutter/foundation.dart';

class SplashScreenProvider with ChangeNotifier {
  bool _isLoading = true;

  bool get isLoading => _isLoading;

  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }
}
