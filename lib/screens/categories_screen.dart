import 'package:flutter/material.dart';
import 'package:irroba_test/services/irroba_category_service.dart';
import 'package:irroba_test/models/category.dart';
import 'package:irroba_test/widgets/categories_widget.dart'; // Importando os widgets da nova estrutura

/// Tela que exibe a lista de categorias carregadas da Irroba API.
class CategoriesScreen extends StatefulWidget {
  final IrrobaCategoryService categoryService;

  /// Construtor da classe CategoriesScreen.
  ///
  /// [categoryService] é necessário para interagir com o serviço de categorias da Irroba.
  CategoriesScreen({required this.categoryService});

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  List<Category> _categories = []; // Lista de categorias carregadas
  bool _isLoading = false; // Indica se a tela está carregando

  @override
  void initState() {
    super.initState();
    _loadCategories();
  }

  /// Método privado para carregar as categorias da API da Irroba.
  Future<void> _loadCategories() async {
    setState(() {
      _isLoading = true; // Ativa o indicador de carregamento
    });

    try {
      var categories = await widget.categoryService.fetchCategories(
          sort: 'date_added', order: 'DESC'); // Busca categorias da API

      setState(() {
        _categories = categories; // Atualiza a lista de categorias
        _isLoading = false; // Desativa o indicador de carregamento
      });
    } catch (e) {
      setState(() {
        _isLoading =
            false; // Em caso de erro, desativa o indicador de carregamento
      });
      print('Erro ao carregar categorias: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categorias'), // Título da barra de navegação
      ),
      body: _isLoading
          ? const LoadingIndicator() // Indicador de carregamento enquanto as categorias são buscadas
          : _categories.isEmpty
              ? const NoDataDisplay() // Exibe mensagem de nenhum dado encontrado se não houver categorias
              : CategoryList(
                  categories:
                      _categories, // Exibe a lista de categorias carregadas
                  onTap: (category) {
                    // Implementar a navegação para detalhes da categoria
                    // Exemplo: Navigator.pushNamed(context, '/category/${category.categoryId}');
                  },
                ),
    );
  }
}
