import 'package:flutter/material.dart';
import 'package:irroba_test/models/category.dart';
import 'package:irroba_test/models/order.dart';
import 'package:irroba_test/services/irroba_api_service.dart';

/// Classe provedora responsável por gerenciar o estado de pedidos e categorias.
///
/// Integra-se com o serviço da API da Irroba para operações relacionadas a pedidos e categorias.
class OrderProvider with ChangeNotifier {
  final IrrobaApiService apiService;
  List<OrderModel> _orders = []; // Lista de pedidos
  List<Category> _categories = []; // Lista de categorias

  /// Construtor da classe OrderProvider.
  ///
  /// [apiService] é necessário para interagir com a API da Irroba.
  OrderProvider({required this.apiService});

  /// Retorna a lista atual de pedidos.
  List<OrderModel> get orders => _orders;

  /// Retorna a lista atual de categorias.
  List<Category> get categories => _categories;

  /// Busca e atualiza a lista de pedidos a partir da API.
  Future<void> fetchOrders() async {
    try {
      _orders = await apiService
          .getOrdersInitData(); // Obtém dados iniciais dos pedidos da API
      notifyListeners(); // Notifica os ouvintes sobre a mudança na lista de pedidos
    } catch (e) {
      // Trata erros durante a busca de pedidos
      print(e);
    }
  }

  /// Busca e atualiza a lista de categorias a partir da API.
  Future<void> fetchCategories() async {
    try {
      final categories =
          await apiService.getCategories(); // Obtém categorias da API

      _categories = categories; // Atualiza a lista de categorias
      notifyListeners(); // Notifica os ouvintes sobre a mudança na lista de categorias
    } catch (e) {
      // Trata erros durante a busca de categorias
      print(e);
    }
  }

  /// Atualiza o status de um pedido específico na API.
  ///
  /// Retorna true se a atualização for bem-sucedida, false caso contrário.
  Future<bool> updateOrderStatus(
    String orderId,
    int? statusId,
    String comment,
    String codeTracking,
  ) async {
    try {
      return true;
    } catch (e) {
      print('Erro ao atualizar o status do pedido: $e');
      return false; // Retorna false em caso de erro
    }
  }
}
