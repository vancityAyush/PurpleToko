import 'dart:core';

import 'package:json_annotation/json_annotation.dart';
import 'package:purple_toko/models/shop_data.dart';

part 'shop.g.dart';

@JsonSerializable()
class Shop {
  final ShopData shop;
  final String status;
  final String offers;
  final double ratings = 4.5;

  Shop({required this.shop, required this.status, required this.offers});

  factory Shop.fromJson(Map<String, dynamic> json) => _$ShopFromJson(json);
}
