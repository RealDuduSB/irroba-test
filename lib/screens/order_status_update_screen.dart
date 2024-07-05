// lib/screens/order_status_update_screen.dart

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:irroba_test/services/irroba_api_service.dart';
import 'package:irroba_test/widgets/order_status_widgets.dart'; // Importando os widgets da nova estrutura
import 'package:provider/provider.dart';
import 'package:irroba_test/provider/auth_provider.dart';

class OrderStatusUpdateScreen extends StatefulWidget {
  final String orderId;

  OrderStatusUpdateScreen({required this.orderId});

  @override
  _OrderStatusUpdateScreenState createState() =>
      _OrderStatusUpdateScreenState();
}

class _OrderStatusUpdateScreenState extends State<OrderStatusUpdateScreen> {
  int? _orderStatusId;
  String _comment = '';
  String _codeTracking = '';

  void _updateOrderStatus(String token) async {
    try {
      final response = await http.put(
        Uri.parse(
            'https://api.irroba.com.br/v1/order/${widget.orderId}/status'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'order_status_id': _orderStatusId,
          'comment': _comment,
          'code_tracking': _codeTracking,
        }),
      );

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        if (responseData['success'] == true) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text('Status do pedido atualizado com sucesso!')),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(
                    'Falha ao atualizar status do pedido: ${responseData['data']}')),
          );
        }
      } else {
        throw Exception('Falha ao atualizar status do pedido');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro: $e')),
      );
    }
  }

  void _handleUpdateOrderStatus() {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final token = authProvider.user?.token;
    if (token != null) {
      _updateOrderStatus(token);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Token não disponível')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Atualizar Status do Pedido'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            StatusIdField(
              onChanged: (value) {
                _orderStatusId = int.tryParse(value!);
              },
            ),
            CommentField(
              onChanged: (value) {
                _comment = value;
              },
            ),
            CodeTrackingField(
              onChanged: (value) {
                _codeTracking = value;
              },
            ),
            const SizedBox(height: 16.0),
            UpdateStatusButton(
              onPressed: _handleUpdateOrderStatus,
            ),
          ],
        ),
      ),
    );
  }
}
