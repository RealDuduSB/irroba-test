class Product {
  final int id;
  final String name;
  final String description; // Adicione o parâmetro description aqui
  final double price;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['product_id'],
      name: json['name'],
      description:
          json['description'], // Atribua o valor do JSON ao description
      price: json['price'].toDouble(), // Converta para double, se necessário
    );
  }
}
