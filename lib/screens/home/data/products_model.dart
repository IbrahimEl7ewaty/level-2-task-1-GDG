class ProductsModel {
  final int id;
  final String title;
  final double price;
  final String image;
  ProductsModel({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
  });
  factory ProductsModel.fromMap(Map<String, dynamic> map) {
    return ProductsModel(
      id: map['id'],
      title: map['title'],
      price: (map['price']as num).toDouble(),
      image: map['image'],
    );
  }
}
