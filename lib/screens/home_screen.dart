import 'package:flutter/material.dart';
import 'package:irroba_test/provider/order_provider.dart';
import 'package:irroba_test/widgets/category_tab.dart';
import 'package:irroba_test/widgets/filters_tab_widget.dart';
import 'package:irroba_test/widgets/navigation_drawer.dart' as custom;
import 'package:irroba_test/widgets/sorting_tab_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Image.asset('assets/Camada_1.png'),
          bottom: const TabBar(
            tabs: [
              Tab(
                child: Text(
                  'Categorias',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Tab(
                child: Text(
                  'Ordenações',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Tab(
                child: Text(
                  'Filtros',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        drawer: const custom.NavigationDrawer(),
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
                  return TabBarView(
                    children: [
                      CategoryTab(categories: orderProvider.categories),
                      const SortingTab(),
                      const FiltersTab(),
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
}
