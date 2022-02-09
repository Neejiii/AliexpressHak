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
    this.text,
    this.title,
    this.pictureUrl,
    this.categoryId,
    this.createdAt,
    this.likeCount,
    this.isLiked,
  });

  String productId;
  String price;
  String discount;
  String text;
  String title;
  String pictureUrl;
  String categoryId;
  String createdAt;
  int likeCount;
  bool isLiked;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        productId: json["product_id"] ?? '',
        price: json["price"] ?? '',
        discount: json["discount"] ?? '',
        text: json["text"] ?? '',
        title: json["title"] ?? '',
        pictureUrl: json["picture_url"] ??
            'https://yandex.ru/images/search?pos=0&from=tabbar&img_url=https%3A%2F%2Fpbs.twimg.com%2Fmedia%2FEkOMb1mX0AIrU7E.jpg&text=white&rpt=simage',
        categoryId: json["category_id"] ?? '',
        createdAt: json["created_at"] ?? '',
        likeCount: json["like_count"] ?? 0,
        isLiked: json["is_liked"] ?? false,
      );
}
