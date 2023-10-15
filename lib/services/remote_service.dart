import 'dart:convert';

import 'package:http/http.dart' as http;

import '../utils/constants/api_urls.dart';

class RemoteService {
  static final _headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  static Future<http.Response> login({
    required String email,
    required String password,
  }) async {
    final body = json.encode({'email': email, 'password': password});
    return http.post(
      Uri.parse(ApiUrls.login),
      body: body,
      headers: _headers,
    );
  }


  static Future<http.Response> assets({
    required String token,
  }) async {
    return http.get(
      Uri.parse(ApiUrls.assets),
      headers: {'Authorization': 'Bearer $token', ..._headers},
    );
  }




}
