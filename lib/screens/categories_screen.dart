import 'package:flutter/material.dart';
import 'package:irroba_test/services/irroba_category_service.dart';
import 'package:irroba_test/models/category.dart';
import 'package:irroba_test/widgets/categories_widget.dart'; // Importando os widgets da nova estrutura

class CategoriesScreen extends StatefulWidget {
  final IrrobaCategoryService categoryService;

  CategoriesScreen({required this.categoryService});

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  List<Category> _categories = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadCategories();
  }

  Future<void> _loadCategories() async {
    setState(() {
      _isLoading = true;
    });

    try {
      var categories = await widget.categoryService
          .fetchCategories(sort: 'date_added', order: 'DESC');
      setState(() {
        _categories = categories;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      // Trate o erro conforme necessário
      print('Erro ao carregar categorias: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categorias'),
      ),
      body: _isLoading
          ? const LoadingIndicator()
          : _categories.isEmpty
              ? const NoDataDisplay()
              : CategoryList(
                  categories: _categories,
                  onTap: (category) {
                    // Implementar a navegação para detalhes da categoria
                    // Exemplo: Navigator.pushNamed(context, '/category/${category.categoryId}');
                  },
                ),
    );
  }
}
