import 'dart:convert';
import 'dart:core';

import 'package:json_annotation/json_annotation.dart';
import 'package:purple_toko/constants.dart';

part 'market_data.g.dart';

@JsonSerializable()
class MarketData {
  final String name;
  final String address;
  final String image;
  MarketData({required this.name, required this.address, required this.image});

  factory MarketData.fromJson(Map<String, dynamic> json) =>
      _$MarketDataFromJson(json);

  Map<String, dynamic> toJson() => _$MarketDataToJson(this);

  String getImageUrl() {
    final img = json.decode(image);
    return "$baseUrl/${img[0]['image']}";
  }
}
