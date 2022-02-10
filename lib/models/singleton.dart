import 'package:flutter/material.dart';
import 'package:mobile/models/collections.dart';
import 'package:mobile/models/products.dart';
import 'package:mobile/models/comments.dart';

import 'categories.dart';
import 'favorites.dart';

class SingletonProvider with ChangeNotifier {
  CategoriesModel categories;
  CollectionsModel collections;
  ProductsModel products;
  CommentsModel comments;

  FavoritesModel favorites;

  String token;

  void updateProvider() {
    notifyListeners();
  }
}
