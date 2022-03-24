import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'requestes.g.dart';

CheckoutRequest checkoutRequestFromJson(String str) =>
    CheckoutRequest.fromJson(json.decode(str));

String checkoutRequestToJson(CheckoutRequest data) =>
    json.encode(data.toJson());

@JsonSerializable()
class CheckoutRequest {
  @JsonKey(name: "userId")
  int userId;
  @JsonKey(name: "date")
  String date;
  @JsonKey(name: "products")
  List<CheckoutIem> products;

  CheckoutRequest({
    required this.userId,
    required this.date,
    required this.products,
  });

  factory CheckoutRequest.fromJson(Map<String, dynamic> json) =>
      _$CheckoutRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CheckoutRequestToJson(this);
}

@JsonSerializable()
class CheckoutIem {
  @JsonKey(name: "productId")
  int productId;
  @JsonKey(name: "quantity")
  int quantity;

  CheckoutIem({
    required this.productId,
    required this.quantity,
  });

  factory CheckoutIem.fromJson(Map<String, dynamic> json) =>
      _$CheckoutIemFromJson(json);

  Map<String, dynamic> toJson() => _$CheckoutIemToJson(this);
}
