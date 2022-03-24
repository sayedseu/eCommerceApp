import 'package:ecommerce_app/data/requestes/requestes.dart';
import 'package:ecommerce_app/domain/model/cart.dart';
import 'package:ecommerce_app/domain/repository/cart_repository.dart';
import 'package:ecommerce_app/resources/strings.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final CartRepository cartRepository;
  RxList<CartItem> carts = RxList();
  RxDouble totalPrice = RxDouble(0);

  CartController(this.cartRepository);

  @override
  void onInit() {
    _retrieveCartItems();
    super.onInit();
  }

  void _retrieveCartItems() {
    List<CartItem> items = cartRepository.getCarts();
    carts.value = items;
    _calculateTotalPrice(items);
  }

  void deleteCartItem(CartItem cartItem) {
    cartRepository.removeFromCart(cartItem);
    _retrieveCartItems();
    carts.refresh();
  }

  void clearCarts() {
    cartRepository.clearCart();
    _retrieveCartItems();
    carts.refresh();
  }

  void _calculateTotalPrice(List<CartItem> items) {
    double sum = 0;
    for (CartItem element in items) {
      double price = element.product.price * element.quantity;
      sum += price;
    }
    totalPrice.value = sum;
  }

  void checkOut() async {
    EasyLoading.show(status: AppStrings.pleaseWait);
    List<CartItem> items = cartRepository.getCarts();
    List<CheckoutIem> checkoutItems = [];
    for (CartItem element in items) {
      CheckoutIem checkoutIem = CheckoutIem(
          productId: element.product.id, quantity: element.quantity);
      checkoutItems.add(checkoutIem);
    }
    String date = DateTime.now().toIso8601String();
    CheckoutRequest checkoutRequest =
        CheckoutRequest(userId: 5, date: date, products: checkoutItems);
    final response = await cartRepository.checkout(checkoutRequest);
    response.fold(
      (failure) {
        EasyLoading.showError(failure.message);
      },
      (data) {
        EasyLoading.showSuccess(AppStrings.checkoutSuccess);
        clearCarts();
      },
    );
  }
}
