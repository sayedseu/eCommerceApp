import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/network/failure.dart';
import 'package:ecommerce_app/data/requestes/requestes.dart';
import 'package:ecommerce_app/domain/model/cart.dart';

abstract class CartRepository {
  void addToCart(CartItem item);

  void removeFromCart(CartItem item);

  void clearCart();

  List<CartItem> getCarts();

  Future<Either<Failure, bool>> checkout(CheckoutRequest request);
}
