import 'dart:core';

import 'package:json_annotation/json_annotation.dart';
import 'package:purple_toko/models/market_data.dart';
import 'package:purple_toko/models/shop.dart';

part 'data.g.dart';

@JsonSerializable()
class Market {
  final MarketData markets;
  final List<Shop> shops;

  Market({required this.markets, required this.shops});

  factory Market.fromJson(Map<String, dynamic> json) => _$MarketFromJson(json);
}
