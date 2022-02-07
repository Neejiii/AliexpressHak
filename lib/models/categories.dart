import 'package:meta/meta.dart';
import 'dart:convert';

CategoriesModel categoriesModelFromJson(String str) =>
    CategoriesModel.fromJson(json.decode(str));

class CategoriesModel {
  CategoriesModel({
    @required this.categories,
  });

  List<Category> categories;

  factory CategoriesModel.fromJson(Map<String, dynamic> json) =>
      CategoriesModel(
        categories: json["categories"] == null
            ? null
            : List<Category>.from(
                json["categories"].map((x) => Category.fromJson(x))),
      );
}

class Category {
  Category({
    @required this.categoryId,
    @required this.title,
    @required this.pictureUrl,
    @required this.parentId,
  });

  String categoryId;
  String title;
  String pictureUrl;
  String parentId;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        categoryId: json["category_id"] == null ? null : json["category_id"],
        title: json["title"] == null ? null : json["title"],
        pictureUrl: json["picture_url"] == null ? null : json["picture_url"],
        parentId: json["parent_id"] == null ? null : json["parent_id"],
      );

  Map<String, dynamic> toJson() => {
        "category_id": categoryId == null ? null : categoryId,
        "title": title == null ? null : title,
        "picture_url": pictureUrl == null ? null : pictureUrl,
        "parent_id": parentId == null ? null : parentId,
      };
}
