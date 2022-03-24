import 'package:ecommerce_app/domain/model/cart.dart';

List<CartItem> carts = [];

abstract class LocalDataSource {
  void addToCart(CartItem item);

  void removeFromCart(CartItem item);

  void clearCart();

  List<CartItem> getCarts();
}

class LocalDataSourceImpl extends LocalDataSource {
  @override
  void addToCart(CartItem item) {
    carts.add(item);
  }

  @override
  void clearCart() {
    carts.clear();
  }

  @override
  void removeFromCart(CartItem item) {
    carts.remove(item);
  }

  @override
  List<CartItem> getCarts() {
    return carts;
  }
}
