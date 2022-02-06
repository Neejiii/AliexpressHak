import 'package:flutter/material.dart';
import 'package:mobile/models/collections.dart';

import 'categories.dart';

class SingletonProvider with ChangeNotifier {
  CategoriesModel categories = CategoriesModel(categories: []);
  CollectionsModel collections = CollectionsModel(categories: []);


  void setCategories(CategoriesModel value) {
    categories = value;
    notifyListeners();
  }

  void setCollections(CollectionsModel value) {
    collections = value;
    notifyListeners();
  }
}
