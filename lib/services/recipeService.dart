import 'dart:convert';

import 'package:http/http.dart' as http;

class RecipeService {
  static final client = http.Client();

  static Future<String> post(String endpoint, var body) async {
    var response = await client
        .post(buildUrl(segment: endpoint), body: jsonEncode(body), headers: {
      "Content-type": "application/json",
    });
    return response.body;
  }

  static Future<String> get(
      {String endpoint = "", Object queryParams = const {}}) async {
    var response = await client.get(buildUrl(segment: endpoint), headers: {
      "Content-type": "application/json",
    });

    return response.body;
  }

  static Future<String> patch(String endpoint, var changes) async {
    var response = await client
        .patch(buildUrl(segment: endpoint), body: changes, headers: {
      "Content-type": "application/json",
    });

    return response.body;
  }

  static Future<String> delete(String endpoint) async {
    var response = await client.delete(buildUrl(segment: endpoint), headers: {
      "Content-type": "application/json",
    });
    print(response.body);
    return response.body;
  }

  static buildUrl({String segment = "", queryParams = const {}}) {
    Uri uri = Uri(
      scheme: "https",
      host: "amberclass.fimijm.com",
      path: "/api/v1$segment",
      // queryParameters: queryParams
    );

    return uri;
  }
}
