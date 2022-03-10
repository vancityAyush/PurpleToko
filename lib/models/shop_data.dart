import 'dart:convert';
import 'dart:core';

import 'package:json_annotation/json_annotation.dart';
import 'package:purple_toko/constants.dart';

part 'shop_data.g.dart';

@JsonSerializable()
class ShopData {
  final String shop_name;
  final String city;
  final String description;
  dynamic image;

  ShopData(
      {required this.shop_name,
      required this.city,
      required this.description,
      required this.image});

  factory ShopData.fromJson(Map<String, dynamic> json) =>
      _$ShopDataFromJson(json);

  dynamic getImageUrl() {
    final List img = json.decode(image);
    return "$baseUrl/${img[0]['image']}";
  }

  Map<String, dynamic> toJson() => _$ShopDataToJson(this);
}
