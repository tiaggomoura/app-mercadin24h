import 'package:mercadin/src/models/user_model.dart';
import 'package:mercadin/src/services/htt_manager.dart';

import '../../../constants/endpoints.dart';

class AuthRepository {
  Future signin({required String email, required String password}) async {
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
      print('Funcionou');
      final user = UserModel.fromJson(result['result']);
      print(user);
    } else {
      print('Não Funcionou');
    }
  }
}
