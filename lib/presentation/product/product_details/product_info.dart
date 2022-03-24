import 'package:ecommerce_app/domain/model/product.dart';
import 'package:ecommerce_app/resources/colors.dart';
import 'package:ecommerce_app/resources/fonts.dart';
import 'package:ecommerce_app/resources/styles.dart';
import 'package:ecommerce_app/resources/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductInfo extends StatelessWidget {
  final Product product;

  const ProductInfo({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: SizedBox(
            child: Image.network(
              product.image,
            ),
            height: MediaQuery.of(context).size.height / 3.5,
          ),
        ),
        const SizedBox(
          height: AppMargin.m24,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                product.title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: FontSize.s20,
                ),
              ),
            ),
            const SizedBox(
              width: AppMargin.m20,
            ),
            Text(
              '\$ ${product.price}',
              style: TextStyle(
                color: ColorManager.darkPrimary,
                fontWeight: FontWeightManager.bold,
                fontSize: FontSize.s24,
              ),
            )
          ],
        ),
        const SizedBox(
          height: AppMargin.m12,
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
              itemPadding:
                  const EdgeInsets.symmetric(horizontal: AppPadding.p4),
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
              '(${product.rating!.count} customer reviews)',
              style: TextStyle(
                color: ColorManager.grey,
                fontWeight: FontWeightManager.bold,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: AppMargin.m20,
        ),
        Text(
          product.description,
          style: getRegularStyle(
            color: ColorManager.grey,
            fontSize: FontSize.s16,
          ),
        ),
      ],
    );
  }
}
