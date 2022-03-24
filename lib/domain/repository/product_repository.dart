import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/network/failure.dart';
import 'package:ecommerce_app/domain/model/product.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<String>>> getAllCategories();

  Future<Either<Failure, List<Product>>> getAllProductFromCategory(
      String categoryName);
}
