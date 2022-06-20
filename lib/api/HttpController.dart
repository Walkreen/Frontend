import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;


class HttpController {

  var client = http.Client();

  Future httpGet(String url) async {
    final response = await client.get(url);

    if (response.statusCode == 200) {
      return json.decode(utf8.decode(response.bodyBytes));
    } else {
      return null;
    }
  }

  Future httpGetWithAuth(String url, String? jwtToken) async {
    final response = await client.get(url,
      headers: {HttpHeaders.authorizationHeader: "Bearer " + jwtToken!});

    if (response.statusCode == 200) {
      return json.decode(utf8.decode(response.bodyBytes));
    } else {
      return null;
    }
  }

  Future post(String url) async {

    final response = await client.post(
      url,
    );

    if (response.statusCode == 200) {
      return json.decode(utf8.decode(response.bodyBytes));
    } else {
      return null;
    }
  }

  Future postByJson(String url, Map<String, dynamic> request) async {

    final response = await client.post(
      url,
      headers: <String, String> {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(request),
    );

    if (response.statusCode == 200) {
      return json.decode(utf8.decode(response.bodyBytes));
    } else {
      return null;
    }
  }

  Future postWithAuth(String url, String? jwtToken) async {

    final response = await client.post(
      url, headers: {HttpHeaders.authorizationHeader: "Bearer " + jwtToken!}
    );

    if (response.statusCode == 200) {
      return json.decode(utf8.decode(response.bodyBytes));
    } else {
      return null;
    }
  }

  Future putWithAuth(String url, String? jwtToken) async {

    final response = await client.put(
        url, headers: {HttpHeaders.authorizationHeader: "Bearer " + jwtToken!}
    );

    if (response.statusCode == 200) {
      return json.decode(utf8.decode(response.bodyBytes));
    } else {
      return null;
    }
  }

  Future putWithAuthArg(String url, String? jwtToken, Map<String, dynamic>? map) async {

    final uri = Uri.parse(url).replace(queryParameters: map);

    final response = await client.put(
        uri, headers: {HttpHeaders.authorizationHeader: "Bearer " + jwtToken!}
    );

    if (response.statusCode == 200) {
      return json.decode(utf8.decode(response.bodyBytes));
    } else {
      return null;
    }
  }

  Future postWithAuthArg(String url, String? jwtToken, Map<String, dynamic>? map) async {

    final uri = Uri.parse(url).replace(queryParameters: map);

    final response = await client.post(
        uri, headers: {HttpHeaders.authorizationHeader: "Bearer " + jwtToken!}
    );

    if (response.statusCode == 200) {
      return json.decode(utf8.decode(response.bodyBytes));
    } else {
      return null;
    }
  }

  Future postByJsonWithAuth(String url, Map<String, dynamic> request, String? jwtToken) async {

    final response = await client.post(
      url,
      headers: {
        HttpHeaders.authorizationHeader: "Bearer " + jwtToken!
      },
      body: jsonEncode(request),
    );

    if (response.statusCode == 200) {
      return json.decode(utf8.decode(response.bodyBytes));
    } else {
      return null;
    }
  }


}