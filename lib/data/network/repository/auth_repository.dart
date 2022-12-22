import '../../../models/login/user_model.dart';
import '../../../models/login/user_response_model.dart';
import '../service/auth_service.dart';
import '../service/http_manager.dart';

class AuthRepository {
  final AuthService _authService = AuthService();

  Future<UserResponseModel> login(
      User model) async {
    try {
      final response =
          await _authService.login(model);

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
