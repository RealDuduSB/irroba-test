import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:irroba_test/provider/order_provider.dart';

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
            future:
                orderProvider.fetchOrders(), // Chama método para buscar pedidos
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // Indicador de carregamento enquanto aguarda a resposta da API
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                // Exibe mensagem de erro caso ocorra um problema durante a busca de pedidos
                return Center(child: Text('Erro: ${snapshot.error}'));
              } else if (orderProvider.orders.isEmpty) {
                // Exibe mensagem caso não haja pedidos encontrados
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
