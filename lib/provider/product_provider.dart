import 'package:flutter/material.dart';
import 'package:irroba_test/models/product.dart';
import 'package:irroba_test/services/product_service.dart';

class ProductProvider with ChangeNotifier {
  final ProductService _productService;
  List<Product> _products = [];

  ProductProvider(this._productService);

  List<Product> get products => _products;

  Future<void> loadProducts() async {
    _products = await _productService.fetchProducts();
    notifyListeners();
  }
}
