import 'dart:convert';

FavoritesModel favoritesModelFromJson(String str) =>
    FavoritesModel.fromJson(json.decode(str));

class FavoritesModel {
  FavoritesModel({
    this.favorites,
  });

  List<Category> favorites;

  factory FavoritesModel.fromJson(Map<String, dynamic> json) =>
      FavoritesModel(
        favorites: json["favorites"] == null
            ? null
            : List<Category>.from(
            json["favorites"].map((x) => Category.fromJson(x))),
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
    setId: json["set_id"] ?? '',
    userId: json["user_id"] ?? '',
    categoryId: json["category_id"] ?? '',
    text: json["text"] ?? '',
    title: json["title"] ?? '',
    pictureUrl: json["picture_url"] ?? '',
    createdAt: json["created_at"] ?? '',
    isLiked: json["is_liked"] ?? false,
  );
}
