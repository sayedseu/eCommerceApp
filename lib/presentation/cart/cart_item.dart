import 'package:ecommerce_app/domain/model/cart.dart';
import 'package:ecommerce_app/presentation/widgets/product_image.dart';
import 'package:ecommerce_app/resources/colors.dart';
import 'package:ecommerce_app/resources/fonts.dart';
import 'package:ecommerce_app/resources/values.dart';
import 'package:flutter/material.dart';

class CartItemView extends StatelessWidget {
  final CartItem cartItem;
  final Function() onDelete;

  const CartItemView({Key? key, required this.cartItem, required this.onDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p12,
        vertical: AppPadding.p12,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ProductImage(imageUrl: cartItem.product.image),
          const SizedBox(
            width: AppMargin.m16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cartItem.product.title,
                  style: const TextStyle(
                      color: Colors.black, fontSize: FontSize.s16),
                ),
                const SizedBox(
                  height: AppMargin.m8,
                ),
                RichText(
                  text: TextSpan(
                    text: '\$ ${cartItem.product.price}',
                    style: TextStyle(
                      color: ColorManager.darkPrimary,
                      fontWeight: FontWeightManager.bold,
                      fontSize: FontSize.s14,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' x ${cartItem.quantity}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ColorManager.grey1,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: onDelete,
            icon: Icon(
              Icons.delete,
              color: ColorManager.grey2,
            ),
          )
        ],
      ),
    );
  }
}
