import 'package:flutter/material.dart';
import 'package:irroba_test/services/irroba_category_service.dart';
import 'package:irroba_test/models/category.dart';
import 'package:irroba_test/widgets/loading_indicator.dart';
import 'package:irroba_test/widgets/no_data_display.dart';
import 'package:irroba_test/widgets/category_list.dart';

/// Tela que exibe a lista de categorias carregadas da API.
class CategoriesScreen extends StatefulWidget {
  final IrrobaCategoryService categoryService;

  const CategoriesScreen({required this.categoryService});

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  List<Category> _categories = []; // Lista de categorias carregadas
  bool _isLoading = false; // Indica se está carregando as categorias

  @override
  void initState() {
    super.initState();
    _loadCategories(); // Carrega as categorias ao inicializar o estado da tela
  }

  /// Método para carregar as categorias da API.
  Future<void> _loadCategories() async {
    setState(() {
      _isLoading = true; // Define que está carregando as categorias
    });

    try {
      // Chama o serviço para buscar as categorias ordenadas por data de adição
      var categories = await widget.categoryService
          .fetchCategories(sort: 'date_added', order: 'DESC');

      setState(() {
        _categories = categories; // Atualiza a lista de categorias carregadas
        _isLoading = false; // Define que terminou de carregar as categorias
      });
    } catch (e) {
      setState(() {
        _isLoading = false; // Define que parou de carregar devido a um erro
      });
      print('Erro ao carregar categorias: $e'); // Registra o erro no console
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categorias'), // Título da tela
      ),
      body: _isLoading
          ? const LoadingIndicator() // Mostra indicador de carregamento se estiver carregando
          : _categories.isEmpty
              ? const NoDataDisplay() // Mostra mensagem de que não há dados se não houver categorias
              : CategoryList(
                  categories: _categories,
                  onTap: (category) {},
                ),
    );
  }
}
