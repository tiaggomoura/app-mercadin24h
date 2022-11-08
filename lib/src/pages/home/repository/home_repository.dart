import 'package:mercadin/src/models/category_model.dart';

import '../../../constants/endpoints.dart';
import '../../../services/htt_manager.dart';
import '../result/home_result.dart';

class HomeRepository {
  final HttpManager _httpManager = HttpManager();

  Future<HomeResult<CategoryModel>> getAllCategories() async {
    final result = await _httpManager.restRequest(
      url: Endpoints.getAllCategories,
      method: HttpMethods.post,
    );

    if (result['result'] != null) {
      List<CategoryModel> data =
          (result['result'] as List<Map<String, dynamic>>).map((e) => CategoryModel.fromJson(e)).toList();

      return HomeResult<CategoryModel>.success(data);
    } else {
      return HomeResult.error('Ocorreu um erro ao recuperar as categorias.');
    }
  }
}
