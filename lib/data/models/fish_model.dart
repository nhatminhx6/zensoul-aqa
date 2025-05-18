class Fish {
  final int id;
  final String name;
  final int price;
  final String image;

  Fish({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
  });

  factory Fish.fromJson(Map<String, dynamic> json) {
    return Fish(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      image: json['image'],
    );
  }
}
