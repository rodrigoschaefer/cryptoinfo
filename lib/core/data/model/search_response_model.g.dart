// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchResponseModel _$SearchResponseModelFromJson(Map<String, dynamic> json) =>
    SearchResponseModel(
      (json['coins'] as List<dynamic>)
          .map((e) => CoinModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchResponseModelToJson(
        SearchResponseModel instance) =>
    <String, dynamic>{
      'coins': instance.coins,
    };
