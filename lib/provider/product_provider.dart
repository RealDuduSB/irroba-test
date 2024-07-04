import 'package:flutter/material.dart';
import 'package:irroba_test/models/product.dart';
import 'package:irroba_test/services/irroba_api_service.dart';

class ProductProvider with ChangeNotifier {
  final IrrobaApiService apiService;
  List<Product> _products = [];

  ProductProvider({required this.apiService});

  List<Product> get products => _products;

  void setProducts(List<Product> products) {
    _products = products;
    notifyListeners();
  }

  Future<void> fetchAndSetProducts() async {
    try {
      List<Product> fetchedProducts = await apiService.fetchProducts();
      List<Product> productsWithStock =
          await apiService.fetchProductStocks(fetchedProducts);
      _products = productsWithStock;
      notifyListeners();
    } catch (e) {
      throw Exception('Failed to fetch products: $e');
    }
  }
}
