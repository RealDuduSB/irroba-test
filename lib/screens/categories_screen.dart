import 'package:flutter/material.dart';
import 'package:irroba_test/services/irroba_category_service.dart';
import 'package:irroba_test/models/category.dart';

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
        title: Text('Categorias'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _categories.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_categories[index].name),
                  subtitle: Text(_categories[index].description),
                  onTap: () {
                    // Implementar a navegação para detalhes da categoria
                    // Exemplo: Navigator.pushNamed(context, '/category/${_categories[index].categoryId}');
                  },
                );
              },
            ),
    );
  }
}
