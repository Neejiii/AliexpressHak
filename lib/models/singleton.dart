import 'package:flutter/material.dart';
import 'package:mobile/models/collections.dart';
import 'package:mobile/models/products.dart';

import 'categories.dart';

class SingletonProvider with ChangeNotifier {
  CategoriesModel categories;
  CollectionsModel collections;
  ProductsModel products;

  String token;

  void setCategories(CategoriesModel value) {
    categories = value;
    notifyListeners();
  }

  void setCollections(CollectionsModel value) {
    collections = value;
    notifyListeners();
  }

  void setProducts(ProductsModel value) {
    products = value;
    notifyListeners();
  }
}
