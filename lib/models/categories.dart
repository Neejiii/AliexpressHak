import 'dart:convert';

CategoriesModel categoriesModelFromJson(String str) => CategoriesModel.fromJson(json.decode(str));

class CategoriesModel {
  CategoriesModel({
    required this.categories,
  });

  List<Category>? categories;

  factory CategoriesModel.fromJson(Map<String, dynamic> json) => CategoriesModel(
    categories: json["categories"] == null ? null : List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
  );

}

class Category {
  Category({
    required this.categoryId,
    required this.title,
    required this.pictureUrl,
    required this.parentId,
  });

  String categoryId;
  String title;
  String pictureUrl;
  int parentId;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    categoryId: json["category_id"] ?? '',
    title: json["title"] ?? '',
    pictureUrl: json["picture_url"] ?? '',
    parentId: json["parent_id"] ?? 0,
  );

}
