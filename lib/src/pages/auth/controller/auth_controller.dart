import 'package:get/get.dart';
import 'package:mercadin/src/pages/auth/repository/auth_repository.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;

  final authRepository = AuthRepository();

  Future<void> signin({required String email, required String password}) async {
    isLoading.value = true;
    // await Future.delayed(const Duration(seconds: 2));
    await authRepository.signin(email: email, password: password);
    isLoading.value = false;
  }
}
