// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShopData _$ShopDataFromJson(Map<String, dynamic> json) => ShopData(
      shop_name: json['shop_name'] as String,
      city: json['city'] as String,
      description: json['description'] as String,
      image: json['image'],
    );

Map<String, dynamic> _$ShopDataToJson(ShopData instance) => <String, dynamic>{
      'shop_name': instance.shop_name,
      'city': instance.city,
      'description': instance.description,
      'image': instance.image,
    };
