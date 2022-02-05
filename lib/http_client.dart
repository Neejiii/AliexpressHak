import 'package:http/http.dart' as http;
import 'package:mobile/mock.dart';

import 'models/catalogs.dart';

class HttpClient {
  static const url = '';

  /// request example
  Future<void> getData() async {
    final response = await http.get(Uri.http(url, "/api/project/all"));
    var data;
    if (response.statusCode < 300) {
      // data = jsonParce(response.body);
      return data;
    } else {
      throw ('getData STATUS CODE: ' + response.statusCode.toString());
    }
  }

  Future<CatalogsModel> getCatalogs() async {
    final response = catalogsFromJson(catalog.toString());
    return response;
  }
}
