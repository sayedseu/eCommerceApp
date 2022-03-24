import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/app/enum.dart';
import 'package:ecommerce_app/data/data_source/local_data_source.dart';
import 'package:ecommerce_app/data/data_source/remote_data_source.dart';
import 'package:ecommerce_app/data/network/error_handler.dart';
import 'package:ecommerce_app/data/network/failure.dart';
import 'package:ecommerce_app/data/network/network_info.dart';
import 'package:ecommerce_app/data/requestes/requestes.dart';
import 'package:ecommerce_app/domain/model/cart.dart';
import 'package:ecommerce_app/domain/repository/cart_repository.dart';

class CartRepositoryImpl extends CartRepository {
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  CartRepositoryImpl(
      this.localDataSource, this.remoteDataSource, this.networkInfo);

  @override
  void addToCart(CartItem item) {
    localDataSource.addToCart(item);
  }

  @override
  void clearCart() {
    localDataSource.clearCart();
  }

  @override
  void removeFromCart(CartItem item) {
    localDataSource.removeFromCart(item);
  }

  @override
  List<CartItem> getCarts() {
    return localDataSource.getCarts();
  }

  @override
  Future<Either<Failure, bool>> checkout(CheckoutRequest request) async {
    if (await networkInfo.isConnected()) {
      try {
        await remoteDataSource.checkout(request);
        return const Right(true);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
