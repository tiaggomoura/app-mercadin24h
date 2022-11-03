import 'package:mercadin/src/models/user_model.dart';
import 'package:mercadin/src/services/htt_manager.dart';

import '../../../constants/endpoints.dart';
import '../result/auth_result.dart';
import '../repository/auth_errors.dart' as authErrors;

class AuthRepository {
  Future<AuthResult> signIn({required String email, required String password}) async {
    final HttpManager _httManager = HttpManager();
    final result = await _httManager.restRequest(
      url: Endpoints.signin,
      method: HttpMethods.post,
      body: {
        "email": email,
        "password": password,
      },
    );

    if (result['result'] != null) {
      final user = UserModel.fromJson(result['result']);
      return AuthResult.success(user);
    } else {
      return AuthResult.error(authErrors.authErrorsString(result['error']));
    }
  }
}
