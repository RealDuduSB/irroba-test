import 'package:flutter/material.dart';
import 'package:irroba_test/models/category.dart';

/// Um widget que exibe uma lista de categorias em um ListView.
class CategoryList extends StatelessWidget {
  /// Lista de categorias a serem exibidas.
  final List<Category> categories;

  /// Função chamada quando um item da lista é tocado.
  final Function(Category) onTap;

  /// Construtor que requer uma lista de `categories` e uma função `onTap`.
  const CategoryList({
    required this.categories,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        return ListTile(
          title: Text(category.name),
          onTap: () => onTap(category),
        );
      },
    );
  }
}
