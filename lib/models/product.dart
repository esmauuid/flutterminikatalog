class Product {
  final int id;
  final String title;
  final String category;
  final double price;
  final String description;
  final String imageUrl;
  final double rating;

  const Product({
    required this.id,
    required this.title,
    required this.category,
    required this.price,
    required this.description,
    required this.imageUrl,
    required this.rating,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int,
      title: json['title'] as String,
      category: json['category'] as String,
      price: (json['price'] as num).toDouble(),
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String,
      rating: (json['rating'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'category': category,
      'price': price,
      'description': description,
      'imageUrl': imageUrl,
      'rating': rating,
    };
  }
}
