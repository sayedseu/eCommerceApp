import 'package:ecommerce_app/app/constant.dart';
import 'package:ecommerce_app/app/enum.dart';
import 'package:ecommerce_app/data/network/rest_client.dart';
import 'package:ecommerce_app/data/requestes/requestes.dart';

abstract class RemoteDataSource {
  Future<dynamic> getAllCategories();

  Future<dynamic> getAllProductFromCategory(String categoryName);

  Future<dynamic> checkout(CheckoutRequest request);
}

class RemoteDataSourceImpl extends RemoteDataSource {
  final RestClientService _clientService;

  RemoteDataSourceImpl(this._clientService);

  @override
  Future<dynamic> getAllCategories() =>
      _clientService.request(url: Urls.ALL_CATEGORY, method: Method.GET);

  @override
  Future getAllProductFromCategory(String categoryName) =>
      _clientService.request(
        url: '${Urls.PRODUCTS_CATEGORIES}/$categoryName',
        method: Method.GET,
      );

  @override
  Future checkout(CheckoutRequest request) => _clientService.request(
        url: Urls.CHECKOUT,
        method: Method.POST,
        params: request.toJson(),
      );
}
