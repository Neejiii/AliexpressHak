import 'dart:convert';

ProductsModel productsModelFromJson(String str) =>
    ProductsModel.fromJson(json.decode(str));

class ProductsModel {
  ProductsModel({
    this.categories,
  });

  List<Product> categories;

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
        categories: json["categories"] == null
            ? null
            : List<Product>.from(
                json["categories"].map((x) => Product.fromJson(x))),
      );
}

class Product {
  Product({
    this.productId,
    this.price,
    this.discount,
    this.title,
    this.pictureUrl,
    this.categoryId,
    this.createdAt,
  });

  String productId;
  String price;
  String discount;
  String title;
  String pictureUrl;
  String categoryId;
  String createdAt;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        productId: json["product_id"] ?? '',
        price: json["price"] ?? '',
        discount: json["discount"] ?? '',
        title: json["title"] ?? '',
        pictureUrl: json["picture_url"] ?? '',
        categoryId: json["category_id"] ?? '',
        createdAt: json["created_at"] ?? '',
      );
}
