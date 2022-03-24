import 'package:ecommerce_app/app/di.dart';
import 'package:ecommerce_app/presentation/cart/cart_controller.dart';
import 'package:ecommerce_app/presentation/cart/cart_item.dart';
import 'package:ecommerce_app/resources/colors.dart';
import 'package:ecommerce_app/resources/fonts.dart';
import 'package:ecommerce_app/resources/strings.dart';
import 'package:ecommerce_app/resources/values.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late CartController _controller;

  @override
  void didChangeDependencies() {
    _controller = Get.put(CartController(instance.get()));
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    Get.delete<CartController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.yourCart),
      ),
      body: Obx(() {
        return _controller.carts.value.isEmpty
            ? const Center(
                child: Text(AppStrings.noItemInCart),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(8),
                    itemCount: _controller.carts.value.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CartItemView(
                        cartItem: _controller.carts.value[index],
                        onDelete: () {
                          _controller
                              .deleteCartItem(_controller.carts.value[index]);
                        },
                      );
                    },
                  ),
                  const Spacer(),
                  Obx(
                    () => Padding(
                      padding: const EdgeInsets.all(AppPadding.p20),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: ColorManager.primary, // background
                          onPrimary: Colors.white, // foreground
                        ),
                        onPressed: () {
                          _controller.checkOut();
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: AppPadding.p16),
                          child: Text(
                            'Check Out  \$${_controller.totalPrice.value}',
                            style: const TextStyle(fontSize: FontSize.s16),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
      }),
    );
  }
}
