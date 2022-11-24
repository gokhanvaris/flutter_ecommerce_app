import 'package:flutter_ecommerce_app/data/network/service/abstract_service.dart';

class AuthService extends AbstractService {
  final String path;
  final String tag;
  AuthService({
    this.path = "auth",
    this.tag = "login",
  }) : super(path, tag);

  Future<dynamic> login() async {
    try {
      final response = await postCustom(
          innerPath: 'login',
          data: {
            "username": "mor_2314",
            "password": "83r5^_"
          });

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
