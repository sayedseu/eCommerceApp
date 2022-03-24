import 'package:ecommerce_app/app/extension.dart';
import 'package:ecommerce_app/data/reponses/responses.dart';
import 'package:ecommerce_app/domain/model/product.dart';

const EMPTY = "";
const ZERO_INT = 0;
const ZERO = 0.0;

extension RatingResponseMapper on RatingResponse? {
  Rating toDomain() {
    return Rating(
      rate: this?.rate?.orZero() ?? ZERO,
      count: this?.count?.orZero() ?? ZERO_INT,
    );
  }
}

extension ProductResponseMapper on ProductResponse? {
  Product toDomain() {
    return Product(
      id: this?.id?.orZero() ?? ZERO_INT,
      title: this?.title?.orEmpty() ?? EMPTY,
      price: this?.price?.orZero() ?? ZERO,
      description: this?.description.orEmpty() ?? EMPTY,
      category: this?.category.orEmpty() ?? EMPTY,
      image: this?.image.orEmpty() ?? EMPTY,
      rating: this?.rating.toDomain(),
    );
  }
}
