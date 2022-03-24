import 'package:ecommerce_app/app/di.dart';
import 'package:ecommerce_app/presentation/category/category_controller.dart';
import 'package:ecommerce_app/resources/routes.dart';
import 'package:ecommerce_app/resources/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/category_item.dart';

class CategoryPage extends StatelessWidget {
  CategoryPage({Key? key}) : super(key: key);

  final CategoryController controller =
      Get.put(CategoryController(instance.get()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.category),
      ),
      body: Obx(
        () => controller.categoriesState.value.when(
          idle: () => const SizedBox(),
          loading: () => const Center(
            child: CircularProgressIndicator(
              color: Colors.amber,
            ),
          ),
          data: (data) {
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return CategoryItem(
                    category: data[index],
                    onTap: () {
                      Navigator.pushNamed(context, Routes.productRoute,
                          arguments: data[index]);
                    },
                  );
                },
              ),
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
