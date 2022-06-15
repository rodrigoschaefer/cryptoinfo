
import 'package:json_annotation/json_annotation.dart';

part 'coin_model.g.dart';

@JsonSerializable()
class CoinModel {

  String id;
  String name;
  String symbol;
  int? marketCapRank;
  String thumb;


  CoinModel(this.id, this.name, this.symbol, this.marketCapRank, this.thumb);

  factory CoinModel.fromJson(Map<String, dynamic> json) => _$CoinModelFromJson(json);
  Map<String, dynamic> toJson() => _$CoinModelToJson(this);
}

