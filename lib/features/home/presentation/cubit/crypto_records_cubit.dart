
import 'package:bloc/bloc.dart';
import 'package:cryptoinfo/core/usecases/usecase.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../data/model/asset_record.dart';
import '../../usecases/fetch_asset_records.dart';



part 'crypto_records_cubit_state.dart';

@injectable
class CryptoRecordsCubit extends Cubit<CryptoRecordsCubitState> {

  FetchAssetRecords fetchAssetRecords;

  static const int pageSize = 10;

  CryptoRecordsCubit({required this.fetchAssetRecords})
      : super(CryptoRecordsCubitState.initial());

  void fetchCryptoRecords() async {

    var result = await fetchAssetRecords.call(NoParams());
    await result.fold(
        (failure) async {
          emit(CryptoRecordsCubitState.failed());
        },
        (response) async {
            emit(state.copyWith(assetList: response));
        }
    );



  }

}
