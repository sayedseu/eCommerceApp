import 'package:ecommerce_app/app/extension.dart';
import 'package:ecommerce_app/resources/colors.dart';
import 'package:ecommerce_app/resources/fonts.dart';
import 'package:ecommerce_app/resources/styles.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String category;
  final Function() onTap;

  const CategoryItem({Key? key, required this.category, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/placeholder.png',
              height: 90,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              category.capitalizeFirstOfEach,
              style: getSemiBoldStyle(
                color: ColorManager.darkGrey,
                fontSize: FontSize.s18,
              ),
            ),
          ],
        ),
        color: ColorManager.lightGrey,
      ),
    );
  }
}
