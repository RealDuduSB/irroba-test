import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:irroba_test/models/category.dart';
import 'package:irroba_test/utils/api_endpoints.dart';

/// Um serviço para lidar com operações relacionadas a categorias através da API da Irroba.
class IrrobaCategoryService {
  /// URL base da API da Irroba.
  static const String baseUrl = 'https://api.irroba.com.br/v1';

  /// Método para buscar uma lista de categorias da API da Irroba.
  ///
  /// Parâmetros opcionais:
  /// - [sort]: Campo pelo qual as categorias devem ser ordenadas.
  /// - [order]: Ordem de classificação (ascendente ou descendente).
  Future<List<Category>> fetchCategories({String? sort, String? order}) async {
    try {
      String url = '$API.GET_CATEGORY';
      if (sort != null && order != null) {
        url += '?sort=$sort&order=$order';
      }

      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = jsonDecode(response.body);

        // Verifica se a requisição foi bem-sucedida
        if (responseData['success'] == 'true') {
          // Extrair dados das categorias
          List<Category> categories = [];
          for (var category in responseData['data']) {
            categories.add(Category.fromJson(category));
          }
          return categories;
        } else {
          throw Exception(
              'Erro ao carregar categorias: ${responseData['data']}');
        }
      } else {
        throw Exception('Falha ao carregar categorias');
      }
    } catch (e) {
      throw Exception('Erro: $e');
    }
  }

  /// Método para buscar uma categoria específica por ID através da API da Irroba.
  ///
  /// [categoryId]: ID da categoria a ser buscada.
  Future<Category> fetchCategoryById(int categoryId) async {
    try {
      final response =
          await http.get(Uri.parse(API.GET_CATEGORY_BY_ID as String));

      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = jsonDecode(response.body);

        // Verifica se a requisição foi bem-sucedida
        if (responseData['success'] == 'true') {
          // Extrair dados da categoria
          return Category.fromJson(responseData['data']);
        } else {
          throw Exception(
              'Erro ao carregar categoria: ${responseData['data']}');
        }
      } else {
        throw Exception('Falha ao carregar categoria');
      }
    } catch (e) {
      throw Exception('Erro: $e');
    }
  }
}
