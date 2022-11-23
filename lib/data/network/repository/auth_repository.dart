import 'package:flutter_ecommerce_app/data/network/service/auth_service.dart';
import 'package:flutter_ecommerce_app/models/login/user_response_model.dart';

class AuthRepository {
  final AuthService _authService = AuthService();

  Future<UserResponseModel> login() async {
    try {
      final response = await _authService.login();
      return UserResponseModel.fromJson(
          response.body);
    } catch (e) {
      rethrow;
    }
  }
}
