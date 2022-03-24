import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'responses.g.dart';

List<ProductResponse> productResponseFromJson(String str) =>
    List<ProductResponse>.from(
        json.decode(str).map((x) => ProductResponse.fromJson(x)));

String productResponseToJson(List<ProductResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@JsonSerializable()
class ProductResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "price")
  double? price;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "category")
  String? category;
  @JsonKey(name: "image")
  String? image;
  @JsonKey(name: "rating")
  RatingResponse? rating;

  ProductResponse({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductResponseToJson(this);
}

@JsonSerializable()
class RatingResponse {
  @JsonKey(name: "rate")
  double? rate;
  @JsonKey(name: "count")
  int? count;

  RatingResponse({
    this.rate,
    this.count,
  });

  factory RatingResponse.fromJson(Map<String, dynamic> json) =>
      _$RatingResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RatingResponseToJson(this);
}
