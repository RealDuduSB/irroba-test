import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:irroba_test/models/category.dart'; // Suponha que você tenha um modelo de categoria

class IrrobaCategoryService {
  static const String baseUrl = 'https://api.irroba.com.br/v1';

  Future<List<Category>> fetchCategories({String? sort, String? order}) async {
    try {
      // Construir a URL com os parâmetros de ordenação, se fornecidos
      String url = '$baseUrl/category';
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

  Future<Category> fetchCategoryById(int categoryId) async {
    try {
      final response =
          await http.get(Uri.parse('$baseUrl/category/$categoryId'));

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
