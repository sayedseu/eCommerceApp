import 'package:ecommerce_app/resources/colors.dart';
import 'package:ecommerce_app/resources/values.dart';
import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  final String imageUrl;

  const ProductImage({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSize.s80,
      child: AspectRatio(
        aspectRatio: 0.88,
        child: Container(
          padding: const EdgeInsets.all(AppPadding.p12),
          decoration: BoxDecoration(
            color: ColorManager.lightGrey,
            borderRadius: BorderRadius.circular(AppSize.s16),
          ),
          child: Image.network(
            imageUrl,
          ),
        ),
      ),
    );
  }
}
