import 'dart:convert';

import 'package:flutter_ecommerce_app/data/network/service/abstract_service.dart';
import 'package:get/get_connect/http/src/response/response.dart';

class AuthService extends AbstractService {
  final String path;
  final String tag;
  AuthService({
    this.path = "auth/",
    this.tag = "login",
  }) : super(path, tag);

  Future<Response> login() async {
    try {
      String myJSON =
          '{"username" : "mor_2314","password" : "83r5^_"}';
      final response = await postCustom(
          innerPath: 'auth/login',
          data: jsonDecode(jsonEncode(myJSON)));

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
