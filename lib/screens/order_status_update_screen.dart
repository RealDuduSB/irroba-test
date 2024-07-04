import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:irroba_test/services/irroba_api_service.dart';
import 'package:irroba_test/widgets/order_status_widgets.dart'; // Importando os widgets da nova estrutura

class OrderStatusUpdateScreen extends StatefulWidget {
  final IrrobaApiService apiService;
  final String orderId;

  OrderStatusUpdateScreen({required this.apiService, required this.orderId});

  @override
  _OrderStatusUpdateScreenState createState() =>
      _OrderStatusUpdateScreenState();
}

class _OrderStatusUpdateScreenState extends State<OrderStatusUpdateScreen> {
  int? _orderStatusId;
  String _comment = '';
  String _codeTracking = '';

  void _updateOrderStatus() async {
    try {
      final response = await http.put(
        Uri.parse(
            'https://api.irroba.com.br/v1/order/${widget.orderId}/status'),
        headers: {
          'Authorization':
              'Bearer ${widget.apiService.getAuthToken()}', // Substitua pelo token correto
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
              onPressed: _updateOrderStatus,
            ),
          ],
        ),
      ),
    );
  }
}
