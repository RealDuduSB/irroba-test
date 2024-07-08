import 'package:flutter/material.dart';

/// Um widget de gaveta de navegação que exibe um menu de navegação com itens para diferentes telas.
class NavigationDrawer extends StatelessWidget {
  /// Construtor padrão.
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.red,
            ),
            child: Text(
              'Menu de Navegação',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Início'),
            onTap: () {
              Navigator.pushNamed(context, '/home');
            },
          ),
          ListTile(
            leading: const Icon(Icons.category),
            title: const Text('Pedidos'),
            onTap: () {
              Navigator.pushNamed(context, '/orderScreen');
            },
          ),
          ListTile(
            leading: const Icon(Icons.inventory),
            title: const Text('Estoque de Produtos'),
            onTap: () {
              Navigator.pushNamed(context, '/productStock');
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Configurações'),
            onTap: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
          ListTile(
            leading: const Icon(Icons.add),
            title: const Text('Cadastrar Produto'),
            onTap: () {
              Navigator.pushNamed(context, '/productRegistration');
            },
          ),
        ],
      ),
    );
  }
}
