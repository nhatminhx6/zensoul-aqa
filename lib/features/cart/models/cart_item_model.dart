class CartItem {
  final String id;
  final String name;
  final String imageUrl;
  final double price;
  final int quantity;

  CartItem({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    this.quantity = 1,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'],
      name: json['name'],
      imageUrl: json['imageUrl'],
      price: (json['price'] as num).toDouble(),
      quantity: json['quantity'] ?? 1,
    );
  }

  CartItem copyWith({int? quantity}) {
    return CartItem(
      id: id,
      name: name,
      imageUrl: imageUrl,
      price: price,
      quantity: quantity ?? this.quantity,
    );
  }
}
