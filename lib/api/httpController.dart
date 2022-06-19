import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;


class HttpController {

  Future<dynamic> httpGet(String url) async {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to get from ' + url);
    }
  }

  Future<dynamic> httpGetWithAuth(String url, String jwtToken) async {
    final response = await http.get(url,
      headers: {HttpHeaders.authorizationHeader: "Bearer " + jwtToken});

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to get from ' + url);
    }
  }

  void post(String url) async {

    http.Response response = await http.post(
      url,
    );
  }

  void postByJson(String url, Map<String, dynamic> json) async {

    http.Response response = await http.post(
      url,
      headers: <String, String> {
        'Content-Type': 'application/json',
      },
      body: <Map<String, dynamic>> {
        json
      },
    );
  }

  void postWithAuth(String url, String jwtToken) async {

    http.Response response = await http.post(
      url, headers: {HttpHeaders.authorizationHeader: "Bearer " + jwtToken}
    );
  }

  void postByJsonWithAuth(String url, Map<String, dynamic> json, String jwtToken) async {

    http.Response response = await http.post(
      url,
      headers: {
        HttpHeaders.authorizationHeader: "Bearer " + jwtToken
      },
      body: <Map<String, dynamic>> {
        json
      },
    );
  }


}