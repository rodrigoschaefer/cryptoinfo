import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cryptoinfo/core/data/model/coin_model.dart';
import 'package:cryptoinfo/core/domain/usecase/search_asset.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';


part 'crypto_cubit_state.dart';

@injectable
class CollaborationCubit extends Cubit<CryptoCubitState> {
  SearchAsset searchAsset;

  static const int pageSize = 10;

  CollaborationCubit(
      {required this.searchAsset})
      : super(CryptoCubitState.initial());


  void searchCryptoAsset({required String partial}) async {

    List<CoinModel> coinList;

    var params = SearchParams(partial: partial);
    var result = await searchAsset.call(params);
    await result.fold(
            (failure) async {
              emit(CryptoCubitState.failed());
            },
            (response) async {

            }
    );


  }

}
