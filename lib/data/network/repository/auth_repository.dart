import 'package:flutter_ecommerce_app/data/network/service/auth_service.dart';
import 'package:flutter_ecommerce_app/data/network/service/http_manager.dart';
import 'package:flutter_ecommerce_app/models/login/user_response_model.dart';

class AuthRepository {
  final AuthService _authService = AuthService();

  Future<UserResponseModel> login() async {
    try {
      final response = await _authService.login();

      setToken(token: response.data['token']);
      return UserResponseModel.fromJson(
          response.data);
    } catch (e) {
      rethrow;
    }
  }

  void setToken({required String token}) {
    HttpManager.token = token;
  }
}
