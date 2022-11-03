import 'package:get/get.dart';
import 'package:mercadin/src/models/user_model.dart';
import 'package:mercadin/src/pages/auth/repository/auth_repository.dart';
import 'package:mercadin/src/pages/auth/result/auth_result.dart';
import 'package:mercadin/src/pages_routes/app_pages.dart';
import 'package:mercadin/src/services/utils_services.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;

  final authRepository = AuthRepository();
  final utilsServices = UtilsServices();

  UserModel user = UserModel();

  Future<void> signin({required String email, required String password}) async {
    isLoading.value = true;

    AuthResult result = await authRepository.signIn(email: email, password: password);
    isLoading.value = false;

    result.when(
      success: (user) {
        this.user = user;
        Get.offAllNamed(PagesRoutes.baseRoute);
      },
      error: (message) {
        utilsServices.showToast(
          message: message,
          isError: true,
        );
      },
    );
  }
}
