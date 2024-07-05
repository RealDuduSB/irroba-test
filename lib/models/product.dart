class Product {
  final String id; // ID único do produto.
  final String name; // Nome do produto.
  int stock; // Quantidade em estoque do produto.

  /// Construtor da classe Product.
  Product({
    required this.id, // ID do produto, obrigatório.
    required this.name, // Nome do produto, obrigatório.
    required this.stock, // Quantidade em estoque do produto, obrigatório.
  });

  /// Método de fábrica para criar uma instância de Product a partir de um mapa JSON.
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'], // ID do produto no JSON.
      name: json['name'], // Nome do produto no JSON.
      stock: json['stock'] ??
          0, // Quantidade em estoque do produto no JSON (opcional, default para 0 se não especificado).
    );
  }

  /// Converte o objeto Product em um mapa JSON.
  Map<String, dynamic> toJson() {
    return {
      'id': id, // ID do produto no mapa JSON.
      'name': name, // Nome do produto no mapa JSON.
      'stock': stock, // Quantidade em estoque do produto no mapa JSON.
    };
  }
}
