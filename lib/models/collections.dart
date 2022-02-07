import 'package:meta/meta.dart';
import 'dart:convert';

CollectionsModel collectionsModelFromJson(String str) => CollectionsModel.fromJson(json.decode(str));

class CollectionsModel {
  CollectionsModel({
    @required this.categories,
  });

  List<Category> categories;

  factory CollectionsModel.fromJson(Map<String, dynamic> json) => CollectionsModel(
    categories: json["categories"] == null ? null : List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
  );

}

class Category {
  Category({
    @required this.productId,
    @required this.price,
    @required this.discount,
    @required this.text,
    @required this.title,
    @required this.pictureUrl,
    @required this.categoryId,
    @required this.createdAt,
    @required this.isLiked,
  });

  String productId;
  String price;
  String discount;
  String text;
  String title;
  String pictureUrl;
  String categoryId;
  String createdAt;
  bool isLiked;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    productId: json["product_id"] ?? '',
    price: json["price"] ?? '',
    discount: json["discount"] ?? '',
    text: json["text"] ?? '',
    title: json["title"] ?? '',
    pictureUrl: json["picture_url"] ?? '',
    categoryId: json["category_id"] ?? '',
    createdAt: json["created_at"] ?? '',
    isLiked: json["is_liked"] ?? false,
  );

}
