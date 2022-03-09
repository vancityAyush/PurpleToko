// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Shop _$ShopFromJson(Map<String, dynamic> json) => Shop(
      shop: ShopData.fromJson(json['shop'] as Map<String, dynamic>),
      status: json['status'] as String,
      offers: json['offers'] as String,
    );

Map<String, dynamic> _$ShopToJson(Shop instance) => <String, dynamic>{
      'shop': instance.shop,
      'status': instance.status,
      'offers': instance.offers,
    };
