class Category {
  final int categoryId; // ID único da categoria.
  final String name; // Nome da categoria.
  final String image; // URL da imagem associada à categoria.
  final String metaTitle; // Título meta para SEO da categoria.
  final String metaDescription; // Descrição meta para SEO da categoria.
  final String description; // Descrição detalhada da categoria.
  final String dateAdded; // Data de adição da categoria.
  final String status; // Status atual da categoria ('active' ou 'inactive').
  final int sortOrder; // Ordem de classificação da categoria.

  /// Construtor da classe Category.
  Category({
    required this.categoryId,
    required this.name,
    required this.image,
    required this.metaTitle,
    required this.metaDescription,
    required this.description,
    required this.dateAdded,
    required this.status,
    required this.sortOrder,
  });

  /// Método de fábrica para criar uma instância de Category a partir de um mapa JSON.
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      categoryId: json['category_id'], // ID da categoria no JSON.
      name: json['category_description'][0]
          ['name'], // Nome da categoria no JSON.
      image: json['image'] ?? '', // Imagem da categoria no JSON (opcional).
      metaTitle: json['category_description'][0]['meta_title'] ??
          '', // Título meta da categoria no JSON (opcional).
      metaDescription: json['category_description'][0]['meta_description'] ??
          '', // Descrição meta da categoria no JSON (opcional).
      description: json['category_description'][0]['description'] ??
          '', // Descrição da categoria no JSON (opcional).
      dateAdded: json['date_added'], // Data de adição da categoria no JSON.
      status: json['status'].toString(), // Status da categoria no JSON.
      sortOrder:
          json['sort_order'], // Ordem de classificação da categoria no JSON.
    );
  }
}
