class Product {
  final String title;
  final String price;
  final String image;
  final bool isTall;

  const Product({
    required this.title,
    required this.price,
    required this.image,
    this.isTall = false,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      title: json['title'] as String,
      price: json['price'] as String,
      image: json['image'] as String,
      isTall: json['isTall'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'price': price,
      'image': image,
      'isTall': isTall,
    };
  }
}
