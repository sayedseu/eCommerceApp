import 'package:ecommerce_app/data/network/result_state.dart';
import 'package:ecommerce_app/domain/model/product.dart';
import 'package:ecommerce_app/domain/repository/product_repository.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  final ProductRepository _productRepository;
  final String categoryName;
  Rx<ResultState<List<Product>>> productsState = Rx(const ResultState.idle());

  ProductController(this._productRepository, this.categoryName);

  @override
  void onInit() {
    _getAllProductFromCategory(categoryName);
    super.onInit();
  }

  void _getAllProductFromCategory(String categoryName) async {
    productsState.value = const ResultState.loading();
    final response =
        await _productRepository.getAllProductFromCategory(categoryName);
    response.fold(
      (failure) {
        productsState.value = ResultState.error(message: failure.message);
      },
      (data) {
        productsState.value = ResultState.data(data: data);
      },
    );
  }
}
