import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/app/enum.dart';
import 'package:ecommerce_app/data/data_source/remote_data_source.dart';
import 'package:ecommerce_app/data/mapper/product_mapper.dart';
import 'package:ecommerce_app/data/network/error_handler.dart';
import 'package:ecommerce_app/data/network/failure.dart';
import 'package:ecommerce_app/data/network/network_info.dart';
import 'package:ecommerce_app/data/reponses/responses.dart';
import 'package:ecommerce_app/domain/model/product.dart';
import 'package:ecommerce_app/domain/repository/product_repository.dart';

class ProductRepositoryImpl extends ProductRepository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  ProductRepositoryImpl(this._remoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, List<String>>> getAllCategories() async {
    if (await _networkInfo.isConnected()) {
      try {
        List<dynamic> response = await _remoteDataSource.getAllCategories();
        List<String> categories = List<String>.from(response.map((x) => x));
        return Right(categories);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getAllProductFromCategory(
    String categoryName,
  ) async {
    if (await _networkInfo.isConnected()) {
      try {
        List<dynamic> response =
            await _remoteDataSource.getAllProductFromCategory(categoryName);
        List<Product> products = List<Product>.from(
            response.map((x) => ProductResponse.fromJson(x).toDomain()));
        return Right(products);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
