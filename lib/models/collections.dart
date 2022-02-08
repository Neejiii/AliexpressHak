import 'dart:convert';

CollectionsModel collectionsModelFromJson(String str) =>
    CollectionsModel.fromJson(json.decode(str));

class CollectionsModel {
  CollectionsModel({
    this.categories,
  });

  List<Category> categories;

  factory CollectionsModel.fromJson(Map<String, dynamic> json) =>
      CollectionsModel(
        categories: json["categories"] == null
            ? null
            : List<Category>.from(
                json["categories"].map((x) => Category.fromJson(x))),
      );
}

class Category {
  Category({
    this.setId,
    this.userId,
    this.categoryId,
    this.text,
    this.title,
    this.pictureUrl,
    this.createdAt,
    this.isLiked,
  });

  String setId;
  String userId;
  String categoryId;
  String text;
  String title;
  String pictureUrl;
  String createdAt;
  bool isLiked;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        setId: json["set_id"] ?? null,
        userId: json["user_id"] ?? null,
        categoryId: json["category_id"] ?? null,
        text: json["text"] ?? null,
        title: json["title"] ?? null,
        pictureUrl: json["picture_url"] ?? null,
        createdAt: json["created_at"] ?? null,
        isLiked: json["is_liked"] ?? null,
      );
}
