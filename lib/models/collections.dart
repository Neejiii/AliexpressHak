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
  Category(
      {this.setId,
      this.userId,
      this.categoryId,
      this.text,
      this.title,
      this.pictureUrl,
      this.createdAt,
      this.isLiked,
      this.likeCount});

  String setId;
  String userId;
  String categoryId;
  String text;
  String title;
  String pictureUrl;
  String createdAt;
  int likeCount;
  bool isLiked;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        setId: json["set_id"] ?? '',
        userId: json["user_id"] ?? '',
        categoryId: json["category_id"] ?? '',
        text: json["text"] ?? '',
        title: json["title"] ?? '',
        pictureUrl: json["picture_url"] ?? '',
        createdAt: json["created_at"] ?? '',
        likeCount: json["like_count"] ?? 0,
        isLiked: json["is_liked"] ?? false,
      );
}
