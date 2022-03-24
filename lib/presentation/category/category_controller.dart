import 'package:ecommerce_app/data/network/result_state.dart';
import 'package:ecommerce_app/domain/repository/product_repository.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  final ProductRepository _productRepository;
  Rx<ResultState<List<String>>> categoriesState = Rx(const ResultState.idle());

  CategoryController(this._productRepository);

  @override
  void onInit() {
    _getAllCategory();
    super.onInit();
  }

  void _getAllCategory() async {
    categoriesState.value = const ResultState.loading();
    final response = await _productRepository.getAllCategories();
    response.fold(
      (failure) {
        categoriesState.value = ResultState.error(message: failure.message);
      },
      (data) {
        categoriesState.value = ResultState.data(data: data);
      },
    );
  }
}
