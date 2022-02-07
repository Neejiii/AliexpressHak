import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

class ProductModel {
  ProductModel({
    this.product,
  });

  Product product;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        product:
            json["product"] == null ? null : Product.fromJson(json["product"]),
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
        productId: json["product_id"] ?? null,
        price: json["price"] ?? null,
        discount: json["discount"] ?? null,
        title: json["title"] ?? null,
        pictureUrl: json["picture_url"] ?? null,
        categoryId: json["category_id"] ?? null,
        createdAt: json["created_at"] ?? null,
      );
}
