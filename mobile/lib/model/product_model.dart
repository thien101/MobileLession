class ProductModel {
  num? id;
  String? title;
  num? price;
  String? description;
  String? category;
  String? image;
  num? sl = 1;

  ProductModel(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.category,
      this.image});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      title: json['title'],
      price: json['price'],
      description: json['description'],
      category: json['category'],
      image: json['imageUrl'],
      id: json['id'],
    );
  }
}
