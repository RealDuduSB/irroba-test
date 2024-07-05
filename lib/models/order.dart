class OrderModel {
  final int id; // ID único do pedido.
  final String status; // Status atual do pedido.

  /// Construtor da classe OrderModel.
  OrderModel({
    required this.id, // ID do pedido, obrigatório.
    required this.status, // Status do pedido, obrigatório.
  });

  /// Método de fábrica para criar uma instância de OrderModel a partir de um mapa JSON.
  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'], // ID do pedido no JSON.
      status: json['status'], // Status do pedido no JSON.
    );
  }
}
