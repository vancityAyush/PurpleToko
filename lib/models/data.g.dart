// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Market _$MarketFromJson(Map<String, dynamic> json) => Market(
      markets: MarketData.fromJson(json['markets'] as Map<String, dynamic>),
      shops: (json['shops'] as List<dynamic>)
          .map((e) => Shop.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MarketToJson(Market instance) => <String, dynamic>{
      'markets': instance.markets,
      'shops': instance.shops,
    };
