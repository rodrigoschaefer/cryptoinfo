
import 'package:json_annotation/json_annotation.dart';

import 'coin_model.dart';

part 'search_response_model.g.dart';

@JsonSerializable()
class SearchResponseModel {

  List<CoinModel> coins;


  SearchResponseModel(this.coins);

  factory SearchResponseModel.fromJson(Map<String, dynamic> json) => _$SearchResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$SearchResponseModelToJson(this);
}

