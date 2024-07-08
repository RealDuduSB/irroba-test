import 'package:flutter/material.dart';
import 'package:irroba_test/models/category.dart';

/// Um widget de aba de categorias que exibe uma lista de categorias.
class CategoryTab extends StatelessWidget {
  /// Lista de categorias a serem exibidas.
  final List<Category> categories;

  /// Construtor que requer uma lista de `categories`.
  const CategoryTab({required this.categories, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        return ListTile(
          title: Text(category.name),
          subtitle: Text('ID: ${category.categoryId}'),
        );
      },
    );
  }
}
