import 'package:flutter/material.dart';
import 'dart:convert';

CatalogsModel catalogsFromJson(String str) => CatalogsModel.fromJson(json.decode(str));

class CatalogsModel with ChangeNotifier{
  CatalogsModel({
    required this.catalogs,
  });

  List<Catalog>? catalogs;

  factory CatalogsModel.fromJson(Map<String, dynamic> json) => CatalogsModel(
        catalogs: json["catalogs"] == null
            ? null
            : List<Catalog>.from(
                json["catalogs"].map((x) => Catalog.fromJson(x))),
      );
}

class Catalog {
  Catalog({
    required this.catalogName,
    required this.products,
  });

  String catalogName;
  List<Product>? products;

  factory Catalog.fromJson(Map<String, dynamic> json) => Catalog(
        catalogName: json["catalog_name"] == null ? null : json["catalog_name"],
        products: json["products"] == null
            ? null
            : List<Product>.from(
                json["products"].map((x) => Product.fromJson(x))),
      );
}

class Product {
  Product({
    required this.productName,
    required this.description,
    required this.isInCart,
    required this.coast,
  });

  String productName;
  String description;
  bool isInCart;
  double coast;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        productName: json["product_name"] == null ? null : json["product_name"],
        description: json["description"] == null ? null : json["description"],
        isInCart: json["isInCart"] == null ? null : json["isInCart"],
        coast: json["coast"] == null ? null : json["coast"].toDouble(),
      );
}
