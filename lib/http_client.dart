import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:mobile/models/product.dart';
import 'package:mobile/models/singleton.dart';
import 'package:mobile/models/comments.dart';
import 'package:provider/provider.dart';

import 'models/categories.dart';
import 'models/collections.dart';
import 'models/favorites.dart';
import 'models/products.dart';

class HttpClient {
  var dio = Dio();
  static const url = 'http://151.248.117.229:8000';

  /// АВТОРИЗАЦИЯ

  Future<String> login(context, String first, String second) async {
    Response response = await dio.post(
      url + "/v1/api/dau/login",
      data: {"first_name": first, "last_name": second},
    );
    if (response.statusCode == 200) {
      Provider.of<SingletonProvider>(context, listen: false).token =
          response.data['token'];
      print(response.data['token']);
      return response.data['token'];
    } else {
      throw ('getCatalogs STATUS CODE: ' + response.statusCode.toString());
    }
  }

  /// РАБОТА С КАТАЛОГОМ

  Future<CategoriesModel> getCategories(context) async {
    var token = Provider.of<SingletonProvider>(context, listen: false).token;
    Response response = await dio.get(
        "http://151.248.117.229:8000/v1/api/dau/categories",
        options: Options(
            responseType: ResponseType.plain,
            headers: {'Authorization': 'Bearer $token'}));

    if (response.statusCode == 200) {
      return categoriesModelFromJson(response.data);
    } else {
      throw ('getCatalogs STATUS CODE: ' + response.statusCode.toString());
    }
  }

  Future<CollectionsModel> getCollections(context, String id) async {
    var token = Provider.of<SingletonProvider>(context, listen: false).token;
    final route = id != '' ? '/v1/api/dau/catalog/$id' : '/v1/api/dau/catalog/';

    Response response = await dio.get(
      url + route,
      queryParameters: {
        'type': 'set',
      },
      options: Options(
          responseType: ResponseType.plain,
          headers: {'Authorization': 'Bearer $token'}),
    );
    if (response.statusCode == 200) {
      return collectionsModelFromJson(response.data);
    } else {
      throw ('getProducts STATUS CODE: ' + response.statusCode.toString());
    }
  }

  Future<ProductsModel> getProducts(context, String id) async {
    var token = Provider.of<SingletonProvider>(context, listen: false).token;
    final route = id != '' ? '/v1/api/dau/catalog/$id' : '/v1/api/dau/catalog/';
    Response response = await dio.get(
      url + route,
      queryParameters: {'type': 'product'},
      options: Options(
          responseType: ResponseType.plain,
          headers: {'Authorization': 'Bearer $token'}),
    );
    if (response.statusCode == 200) {
      return productsModelFromJson(response.data);
    } else {
      throw ('getProducts STATUS CODE: ' + response.statusCode.toString());
    }
  }

  Future<FavoritesModel> getFavorite(context, String type) async {
    var token = Provider.of<SingletonProvider>(context, listen: false).token;
    Response response = await dio.get(
      url + '/v1/api/dau/favorites',
      queryParameters: {'like_type': type},
      options: Options(
          responseType: ResponseType.plain,
          headers: {'Authorization': 'Bearer $token'}),
    );
    if (response.statusCode == 200) {
      return favoritesModelFromJson(response.data);
    } else {
      throw ('getProducts STATUS CODE: ' + response.statusCode.toString());
    }
  }

  /// ПОДРОБНЫЕ

  Future<ProductModel> getProduct(String id) async {
    final response = await http.get(Uri.http(url, "/v1/api/dau/products/$id"));
    if (response.statusCode == 200) {
      return productModelFromJson(utf8.decode(response.bodyBytes));
    } else {
      throw ('getProduct STATUS CODE: ' + response.statusCode.toString());
    }
  }

  Future<int> favorite(context, String productId, String type) async {
    var token = Provider.of<SingletonProvider>(context, listen: false).token;
    final response = await dio.post(
      url + "/v1/api/dau/favorites",
      data: {'id': productId, 'like_type': type},
      options: Options(
          responseType: ResponseType.plain,
          headers: {'Authorization': 'Bearer $token'}),
    );
    print(response);
    if (response.statusCode == 200) {
      return response.statusCode;
    } else {
      throw ('favorite STATUS CODE: ' + response.statusCode.toString());
    }
  }

  Future<int> createCollection(context, List products, List categoryIds,
      String title, String text) async {
    final catIndexes = categoryIds.map((el) => el.categoryId);
    final productsIds = products.map((el) => el.id);

    var token = Provider.of<SingletonProvider>(context, listen: false).token;
    final response = await dio.post(url + "/v1/api/dau/catalog/sets",
        options: Options(
            responseType: ResponseType.plain,
            headers: {'Authorization': 'Bearer $token'}),
        data: {
          "category_id": catIndexes,
          "products": productsIds,
          "title": title,
          "text": text
        });
    if (response.statusCode == 200) {
      return response.statusCode;
    } else {
      throw ('favorite STATUS CODE: ' + response.statusCode.toString());
    }
  }

  Future<CommentsModel> GetComments(String id) async {
    final response = await http.get(Uri.http(url, "/v1/api/dau/comments$id"));
    print(utf8.decode(response.bodyBytes));
    if (response.statusCode == 200) {
      return commentsModelFromJson(utf8.decode(response.bodyBytes));
    } else {
      throw ('getProduct STATUS CODE: ' + response.statusCode.toString());
    }
  }
}
