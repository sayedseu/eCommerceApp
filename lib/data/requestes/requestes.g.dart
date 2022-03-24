// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'requestes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckoutRequest _$CheckoutRequestFromJson(Map<String, dynamic> json) =>
    CheckoutRequest(
      userId: json['userId'] as int,
      date: json['date'] as String,
      products: (json['products'] as List<dynamic>)
          .map((e) => CheckoutIem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CheckoutRequestToJson(CheckoutRequest instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'date': instance.date,
      'products': instance.products,
    };

CheckoutIem _$CheckoutIemFromJson(Map<String, dynamic> json) => CheckoutIem(
      productId: json['productId'] as int,
      quantity: json['quantity'] as int,
    );

Map<String, dynamic> _$CheckoutIemToJson(CheckoutIem instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'quantity': instance.quantity,
    };
