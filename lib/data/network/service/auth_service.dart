import '../../../constants/enums/network_enums.dart';
import '../../../models/login/user_model.dart';
import 'abstract_service.dart';

class AuthService extends AbstractService {
  final String path;
  final String tag;
  AuthService({
    this.path = "auth",
    this.tag = "login",
  }) : super(path, tag);

  Future<dynamic> login(User model) async {
    try {
      final response = await postCustom(
        innerPath: NetworkEnums.LOGIN.value,
        data: {
          "username": model.email,
          "password": model.password,
        },
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
