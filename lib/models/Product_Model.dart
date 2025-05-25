class Product {
  final String id;
  final String name;
  final String description;
  final String imageBase64;
  final double price;
  final int sold;
  final double rating;
  final int stock;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.imageBase64,
    required this.price,
    required this.sold,
    required this.rating,
    required this.stock,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      imageBase64: json['imageBase64'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      sold: json['sold'] ?? 0,
      rating: (json['rating'] ?? 0).toDouble(),
      stock: json['stock'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'imageBase64': imageBase64,
      'price': price,
      'sold': sold,
      'rating': rating,
      'stock': stock,
    };
  }
}
