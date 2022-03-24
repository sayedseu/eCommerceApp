import 'package:ecommerce_app/domain/model/cart.dart';
import 'package:ecommerce_app/domain/model/product.dart';
import 'package:ecommerce_app/domain/repository/cart_repository.dart';
import 'package:ecommerce_app/resources/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  final CartRepository cartRepository;
  RxString quantity = RxString('1');

  ProductDetailsController(this.cartRepository);

  void addToCart(BuildContext context, Product product) {
    CartItem cartItem = CartItem(int.parse(quantity.value), product);
    cartRepository.addToCart(cartItem);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(AppStrings.successfullyAddedToCart),
      ),
    );
  }
}
