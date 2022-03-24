import 'package:ecommerce_app/app/di.dart';
import 'package:ecommerce_app/domain/model/product.dart';
import 'package:ecommerce_app/presentation/product/product_details/product_details_controller.dart';
import 'package:ecommerce_app/presentation/product/product_details/product_info.dart';
import 'package:ecommerce_app/resources/colors.dart';
import 'package:ecommerce_app/resources/fonts.dart';
import 'package:ecommerce_app/resources/strings.dart';
import 'package:ecommerce_app/resources/styles.dart';
import 'package:ecommerce_app/resources/values.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({Key? key}) : super(key: key);

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  late ProductDetailsController _controller;
  late Product _product;

  @override
  void didChangeDependencies() {
    _product = ModalRoute.of(context)!.settings.arguments as Product;
    _controller = Get.put(ProductDetailsController(instance.get()));
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    Get.delete<ProductDetailsController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.productDetails),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p20,
          vertical: AppPadding.p12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductInfo(product: _product),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppPadding.p16, vertical: AppPadding.p4),
                    decoration: BoxDecoration(
                      color: ColorManager.lightGrey,
                      borderRadius: BorderRadius.circular(AppSize.s12),
                    ),
                    child: Row(
                      children: [
                        Obx(
                          () => Text(
                            'Quantity:  ${_controller.quantity.value}',
                            style: const TextStyle(fontSize: FontSize.s16),
                          ),
                        ),
                        const Spacer(),
                        DropdownButton<String>(
                          items:
                              <String>['1', '2', '3', '4'].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style:
                                    getRegularStyle(color: ColorManager.grey2),
                              ),
                            );
                          }).toList(),
                          style: getRegularStyle(color: ColorManager.primary),
                          onChanged: (newValue) {
                            _controller.quantity.value = newValue ?? '1';
                          },
                          underline: const SizedBox(),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: AppMargin.m20,
                ),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: ColorManager.primary, // background
                      onPrimary: Colors.white, // foreground
                    ),
                    onPressed: () {
                      _controller.addToCart(context, _product);
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: AppPadding.p16),
                      child: Text(
                        AppStrings.addToCart,
                        style: TextStyle(fontSize: FontSize.s16),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
