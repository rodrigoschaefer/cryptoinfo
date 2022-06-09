import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cryptoinfo/core/data/model/coin_model.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../domain/usecase/search_asset.dart';


part 'crypto_search_cubit_state.dart';

@injectable
class CryptoSearchCubit extends Cubit<CryptoSearchCubitState> {
  SearchAsset searchAsset;

  static const int pageSize = 10;

  CryptoSearchCubit(
      {required this.searchAsset})
      : super(CryptoSearchCubitState.initial());


  void searchCryptoAsset({required String partial}) async {

    List<CoinModel> coinList;

    var params = SearchParams(partial: partial);
    var result = await searchAsset.call(params);
    await result.fold(
            (failure) async {
              emit(CryptoSearchCubitState.failed());
            },
            (response) async {

            }
    );


  }

}
