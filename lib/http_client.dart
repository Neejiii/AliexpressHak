import 'package:http/http.dart' as http;

class HttpClient {
  static const url = '';

  /// request example
  Future<void> getData() async {
    final response = await http.get(
        Uri.http(url, "/api/project/all")
    );
    var data;
    if (response.statusCode < 300) {
      // data = jsonParce(response.body);
      return data;
    } else {
      throw ('getData STATUS CODE: ' + response.statusCode.toString());
    }
  }
}
