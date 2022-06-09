import 'package:json_annotation/json_annotation.dart';

part 'asset_record.g.dart';

@JsonSerializable()
class AssetRecord{

  final String? thumbImageUrl;
  final String name;
  final String symbol;
  final double price;
  final String currency;

  AssetRecord(
  {this.thumbImageUrl, required this.name, required this.symbol, required this.price, required this.currency});

  factory AssetRecord.fromJson(Map<String, dynamic> json) => _$AssetRecordFromJson(json);
  Map<String, dynamic> toJson() => _$AssetRecordToJson(this);
}