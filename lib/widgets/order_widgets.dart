import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:irroba_test/provider/order_provider.dart';

/// Tela que exibe a lista de pedidos.
class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Pedidos'),
      ),
      body: Consumer<OrderProvider>(
        builder: (context, orderProvider, _) {
          return FutureBuilder(
            future: orderProvider.fetchOrders(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Erro: ${snapshot.error}'));
              } else if (orderProvider.orders.isEmpty) {
                return const Center(child: Text('Nenhum pedido encontrado.'));
              } else {
                // Exibe a lista de pedidos
                return ListView.builder(
                  itemCount: orderProvider.orders.length,
                  itemBuilder: (context, index) {
                    final order = orderProvider.orders[index];
                    return ListTile(
                      title: Text('Pedido #${order.id}'),
                      subtitle: Text('Status: ${order.status}'),
                    );
                  },
                );
              }
            },
          );
        },
      ),
    );
  }
}
