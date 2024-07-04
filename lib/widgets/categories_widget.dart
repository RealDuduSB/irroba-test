import 'package:flutter/material.dart';
import 'package:irroba_test/models/category.dart';

class CategoryList extends StatelessWidget {
  final List<Category> categories;
  final Function(Category) onTap;

  const CategoryList({Key? key, required this.categories, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(categories[index].name),
          subtitle: Text(categories[index].description),
          onTap: () {
            onTap(categories[index]);
          },
        );
      },
    );
  }
}

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

class ErrorDisplay extends StatelessWidget {
  final String message;

  const ErrorDisplay({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Erro: $message'),
    );
  }
}

class NoDataDisplay extends StatelessWidget {
  const NoDataDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Nenhuma categoria encontrada.'),
    );
  }
}
