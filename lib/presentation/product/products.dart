import 'package:ecommerce_app/app/di.dart';
import 'package:ecommerce_app/app/extension.dart';
import 'package:ecommerce_app/presentation/product/product_controller.dart';
import 'package:ecommerce_app/presentation/product/product_item.dart';
import 'package:ecommerce_app/resources/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  String? _categoryName;
  late ProductController _controller;

  @override
  void didChangeDependencies() {
    _categoryName = ModalRoute.of(context)!.settings.arguments as String;
    _controller =
        Get.put(ProductController(instance.get(), _categoryName.orEmpty()));
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    Get.delete<ProductController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_categoryName.orEmpty().capitalizeFirstOfEach),
      ),
      body: Obx(
        () => _controller.productsState.value.when(
          idle: () => const SizedBox(),
          loading: () => const Center(
            child: CircularProgressIndicator(
              color: Colors.amber,
            ),
          ),
          data: (data) {
            return ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return ProductItem(
                    product: data[index],
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        Routes.productDetailsRoute,
                        arguments: data[index],
                      );
                    });
              },
            );
          },
          error: (error) => Center(
            child: Text(error),
          ),
        ),
      ),
    );
  }
}
