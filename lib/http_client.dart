import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobile/mock.dart';

import 'models/categories.dart';

class HttpClient {
  static const url = '151.248.117.229:8000';

  Future<CategoriesModel> getCatalogs() async {
    print(123);
    final response = await http.get(Uri.http(url, "v1/api/dau/catalog"));
    print(1232);
    if (response.statusCode == 200) {
      return categoriesModelFromJson(utf8.decode(response.bodyBytes));
    } else {
      throw ('getCatalogs STATUS CODE: ' + response.statusCode.toString());
    }
  }
  //
  // Future<CatalogsModel> getCatalogs() async {
  //   final response = catalogsFromJson(catalog.toString());
  //   return response;
  // }
}
