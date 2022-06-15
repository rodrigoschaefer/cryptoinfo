// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoinModel _$CoinModelFromJson(Map<String, dynamic> json) => CoinModel(
      json['id'] as String,
      json['name'] as String,
      json['symbol'] as String,
      json['marketCapRank'] as int?,
      json['thumb'] as String,
    );

Map<String, dynamic> _$CoinModelToJson(CoinModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'symbol': instance.symbol,
      'marketCapRank': instance.marketCapRank,
      'thumb': instance.thumb,
    };
