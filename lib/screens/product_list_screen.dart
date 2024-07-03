import 'package:flutter/material.dart';
import 'package:irroba_test/provider/product_provider.dart';
import 'package:provider/provider.dart';

class ProductListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Produtos')),
      body: Consumer<ProductProvider>(
        builder: (context, productProvider, child) {
          return ListView.builder(
            itemCount: productProvider.products.length,
            itemBuilder: (context, index) {
              final product = productProvider.products[index];
              return ListTile(
                title: Text(product.name),
                //subtitle: Text(product.description),
              );
            },
          );
        },
      ),
    );
  }
}
