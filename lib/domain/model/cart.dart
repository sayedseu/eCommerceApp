import 'package:ecommerce_app/domain/model/product.dart';

class CartItem {
  int quantity;
  Product product;

  CartItem(this.quantity, this.product);
}
