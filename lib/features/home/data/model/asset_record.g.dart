// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssetRecord _$AssetRecordFromJson(Map<String, dynamic> json) => AssetRecord(
      thumbImageUrl: json['thumbImageUrl'] as String?,
      name: json['name'] as String,
      symbol: json['symbol'] as String,
      price: (json['price'] as num).toDouble(),
      currency: json['currency'] as String,
    );

Map<String, dynamic> _$AssetRecordToJson(AssetRecord instance) =>
    <String, dynamic>{
      'thumbImageUrl': instance.thumbImageUrl,
      'name': instance.name,
      'symbol': instance.symbol,
      'price': instance.price,
      'currency': instance.currency,
    };
