import 'package:ecommerce_app/domain/model/product.dart';
import 'package:ecommerce_app/presentation/widgets/product_image.dart';
import 'package:ecommerce_app/resources/colors.dart';
import 'package:ecommerce_app/resources/fonts.dart';
import 'package:ecommerce_app/resources/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  final Function() onTap;

  const ProductItem({Key? key, required this.product, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p12,
          vertical: AppPadding.p12,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ProductImage(imageUrl: product.image),
            const SizedBox(
              width: AppMargin.m16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: const TextStyle(
                        color: Colors.black, fontSize: FontSize.s16),
                  ),
                  const SizedBox(
                    height: AppMargin.m8,
                  ),
                  Row(
                    children: [
                      RatingBar.builder(
                        initialRating: product.rating!.rate,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: AppSize.s20,
                        itemPadding: const EdgeInsets.symmetric(
                            horizontal: AppPadding.p4),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (double value) {},
                      ),
                      const SizedBox(
                        width: AppMargin.m8,
                      ),
                      Text(
                        '(${product.rating!.count})',
                        style: TextStyle(
                          color: ColorManager.grey,
                          fontWeight: FontWeightManager.bold,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: AppMargin.m8,
                  ),
                  Text(
                    '\$ ${product.price}',
                    style: TextStyle(
                      color: ColorManager.darkPrimary,
                      fontWeight: FontWeightManager.bold,
                      fontSize: FontSize.s14,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
