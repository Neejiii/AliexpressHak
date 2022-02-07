import 'dart:convert';

CollectionsModel collectionsModelFromJson(String str) =>
    CollectionsModel.fromJson(json.decode(str));

class CollectionsModel {
  CollectionsModel({
    this.categories,
  });

  List<Collection> categories;

  factory CollectionsModel.fromJson(Map<String, dynamic> json) =>
      CollectionsModel(
        categories: json["categories"] == null
            ? null
            : List<Collection>.from(
                json["categories"].map((x) => Collection.fromJson(x))),
      );
}

class Collection {
  Collection({
    this.setId,
    this.userId,
    this.categoryId,
    this.text,
    this.pictureUrl,
    this.createdAt,
  });

  String setId;
  String userId;
  String categoryId;
  String text;
  String pictureUrl;
  String createdAt;

  factory Collection.fromJson(Map<String, dynamic> json) => Collection(
        setId: json["set_id"] ?? '',
        userId: json["user_id"] ?? '',
        categoryId: json["category_id"] ?? '',
        text: json["text"] ?? '',
        pictureUrl: json["picture_url"] ?? '',
        createdAt: json["created_at"] ?? '',
      );
}
