import 'dart:convert';
import 'package:http/http.dart' as http;

import 'models/categories.dart';
import 'models/collections.dart';

class HttpClient {
  static const url = '151.248.117.229:8000';

  Future<CategoriesModel> getCatalogs() async {
    final response = await http.get(Uri.http(url, "v1/api/dau/categories"));
    if (response.statusCode == 200) {
      return categoriesModelFromJson(utf8.decode(response.bodyBytes));
    } else {
      throw ('getCatalogs STATUS CODE: ' + response.statusCode.toString());
    }
  }

  Future<CollectionsModel> getCollections(String id) async {
    final response = await http.get(Uri.http(url, "v1/api/dau/catalog/$id"));
    if (response.statusCode == 200) {
      return collectionsModelFromJson(utf8.decode(response.bodyBytes));
    } else {
      throw ('getCollections STATUS CODE: ' + response.statusCode.toString());
    }
  }
}
