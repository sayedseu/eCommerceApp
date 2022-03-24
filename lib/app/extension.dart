import 'package:ecommerce_app/data/mapper/product_mapper.dart';
import 'package:get/get_utils/src/extensions/string_extensions.dart';

extension CapExtension on String {
  String get capitalizeFirstOfEach =>
      split(" ").map((str) => str.capitalize).join(" ");
}

extension NonNullString on String? {
  String orEmpty() {
    if (this == null) {
      return EMPTY;
    } else {
      return this!;
    }
  }
}

extension NonNullInteger on int? {
  int orZero() {
    if (this == null) {
      return ZERO_INT;
    } else {
      return this!;
    }
  }
}

extension NonNullDouble on double? {
  double orZero() {
    if (this == null) {
      return ZERO;
    } else {
      return this!;
    }
  }
}
