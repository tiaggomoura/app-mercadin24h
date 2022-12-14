import 'package:get/get.dart';

import '../../../models/category_model.dart';
import '../../../services/utils_services.dart';
import '../repository/home_repository.dart';
import '../result/home_result.dart';

class HomeController extends GetxController {
  final homeRepository = HomeRepository();
  final utilsServices = UtilsServices();
  bool isLoading = false;
  List<CategoryModel> allCategories = [];
  CategoryModel? currentCategory;

  @override
  void onInit() {
    super.onInit();
    getAllCategories();
  }

  void setLoading(bool value) {
    isLoading = value;
    update();
  }

  Future<void> getAllCategories() async {
    setLoading(true);
    HomeResult<CategoryModel> homeResult = await homeRepository.getAllCategories();
    setLoading(false);

    homeResult.when(
      success: (data) {
        allCategories.assignAll(data);
        if (allCategories.isNotEmpty) {
          selectCategory(allCategories.first);
        }

        print('Todas as categorias: $allCategories');
      },
      error: (message) {
        utilsServices.showToast(
          message: message,
          isError: true,
        );
      },
    );
  }

  void selectCategory(CategoryModel category) {
    currentCategory = category;
    update();
  }
}
