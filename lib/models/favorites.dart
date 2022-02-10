import 'dart:convert';

FavoritesModel favoritesModelFromJson(String str) =>
    FavoritesModel.fromJson(json.decode(str));

class FavoritesModel {
  FavoritesModel({
    this.favorites,
  });

  List<Favorite> favorites;

  factory FavoritesModel.fromJson(Map<String, dynamic> json) => FavoritesModel(
        favorites: json["favorites"] == null
            ? null
            : List<Favorite>.from(
                json["favorites"].map((x) => Favorite.fromJson(x))),
      );
}

class Favorite {
  Favorite({
    this.id,
    this.setId,
    this.userId,
    this.categoryId,
    this.text,
    this.title,
    this.pictureUrl,
    this.createdAt,
    this.isLiked,
  });

  String id;
  String setId;
  String userId;
  String categoryId;
  String text;
  String title;
  String pictureUrl;
  String createdAt;
  bool isLiked;

  factory Favorite.fromJson(Map<String, dynamic> json) => Favorite(
        setId: json["id"] ?? '',
        userId: json["user_id"] ?? '',
        categoryId: json["category_id"] ?? '',
        text: json["text"] ?? '',
        title: json["title"] ?? '',
        pictureUrl: json["picture_url"] ?? '',
        createdAt: json["created_at"] ?? '',
        isLiked: json["is_liked"] ?? false,
      );
}
