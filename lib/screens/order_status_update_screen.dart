import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:irroba_test/services/irroba_api_service.dart';

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
  int _notify = 1; // Notificar por padrão
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
          'notify': _notify,
          'comment': _comment,
          'code_tracking': _codeTracking,
        }),
      );

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        if (responseData['success'] == 'true') {
          // Sucesso ao atualizar status
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Status do pedido atualizado com sucesso!')),
          );
        } else {
          // Problema ao atualizar status
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
        title: Text('Atualizar Status do Pedido'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Novo ID de Status'),
              onChanged: (value) => _orderStatusId = int.tryParse(value),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Comentário'),
              onChanged: (value) => _comment = value,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Código de Rastreio'),
              onChanged: (value) => _codeTracking = value,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _updateOrderStatus,
              child: Text('Atualizar Status'),
            ),
          ],
        ),
      ),
    );
  }
}
