import 'package:flutter/material.dart';
import 'package:irroba_test/models/category.dart';
import 'package:irroba_test/provider/order_provider.dart';
import 'package:provider/provider.dart';

/// Tela inicial que exibe uma lista de pedidos organizada em abas.
///
/// Esta tela utiliza o `OrderProvider` para buscar e exibir pedidos e categorias.
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Número de abas
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Lista de Pedidos'), // Título da barra de navegação
          bottom: TabBar(
            tabs: [
              Tab(text: 'Categorias'), // Aba de categorias
              Tab(text: 'Ordenações'), // Aba de ordenações
              Tab(text: 'Filtros'), // Aba de filtros
            ],
          ),
        ),
        body: Consumer<OrderProvider>(
          builder: (context, orderProvider, _) {
            return FutureBuilder(
              future: orderProvider
                  .fetchOrders(), // Chama método para buscar pedidos
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
                  // Exibe as abas com base nos dados carregados
                  return TabBarView(
                    children: [
                      // Primeira aba: Categorias
                      _buildCategoriesTab(orderProvider.categories),
                      // Segunda aba: Ordenações (ainda não implementada)
                      _buildSortingTab(),
                      // Terceira aba: Filtros (ainda não implementada)
                      _buildFiltersTab(),
                    ],
                  );
                }
              },
            );
          },
        ),
      ),
    );
  }

  /// Constrói a aba de categorias com base na lista fornecida.
  Widget _buildCategoriesTab(List<Category> categories) {
    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        return ListTile(
          title: Text(category.name), // Nome da categoria
          subtitle: Text('ID: ${category.categoryId}'), // ID da categoria
        );
      },
    );
  }

  /// Constrói a aba de ordenações (placeholder).
  Widget _buildSortingTab() {
    return Center(
      child: Text('Aba de Ordenações'), // Mensagem de placeholder
    );
  }

  /// Constrói a aba de filtros (placeholder).
  Widget _buildFiltersTab() {
    return Center(
      child: Text('Aba de Filtros'), // Mensagem de placeholder
    );
  }
}
