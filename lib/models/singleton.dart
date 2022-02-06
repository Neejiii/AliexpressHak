import 'package:flutter/cupertino.dart';

import 'categories.dart';

class SingletonProvider with ChangeNotifier {
  CategoriesModel categories = CategoriesModel(categories: []);

  void updateProvider() {
    notifyListeners();
  }
}
