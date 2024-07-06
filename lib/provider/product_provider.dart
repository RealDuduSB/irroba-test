import 'package:flutter/material.dart';
import 'package:irroba_test/models/product.dart';
import 'package:irroba_test/services/irroba_api_service.dart';

class ProductProvider with ChangeNotifier {
  final IrrobaApiService _apiService = IrrobaApiService();

  Future<bool> addProduct({
    required String name,
    required int categoryId,
    required double price,
    required int stock,
  }) async {
    try {
      final productData = {
        'name': name,
        'category_id': categoryId,
        'price': price,
        'stock': stock,
      };
      await _apiService.createProduct(productData);
      return true;
    } catch (e) {
      print('Error creating product: $e');
      return false;
    }
  }
}
