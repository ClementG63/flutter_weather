import 'package:flutter_weather/data/util/url_builder.dart';
import 'package:http/http.dart' as http;

class ApiHelper {
  static Future<http.Response> get({required String url, Map<String, dynamic>? params}) async {
    return http.get(
      Uri.parse(params != null ? buildUrlWithParams(url, params) : url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
  }
}
