part of 'crypto_records_cubit.dart';

@immutable
class CryptoRecordsCubitState extends Equatable {

  CryptoRecordsCubitOperation cryptoRecordsCubitOperation;
  List<AssetRecord> assetList;
  bool loading;
  bool? failed;

  CryptoRecordsCubitState({this.assetList = const [],this.loading = false,this.failed,this.cryptoRecordsCubitOperation = CryptoRecordsCubitOperation.initial});

  CryptoRecordsCubitState copyWith({
    List<AssetRecord>? assetList,
    bool? loading,
    bool? failed,
    CryptoRecordsCubitOperation? cryptoRecordsCubitOperation
  }) {
    return CryptoRecordsCubitState(
        assetList: assetList ?? this.assetList,
        loading: loading ?? this.loading,
        failed: failed ?? this.failed,
        cryptoRecordsCubitOperation: cryptoRecordsCubitOperation ?? this.cryptoRecordsCubitOperation
    );
  }

  @override
  List<Object?> get props => [
    assetList,
    loading,
    failed,
    cryptoRecordsCubitOperation
  ];

  factory CryptoRecordsCubitState.initial() {
    return CryptoRecordsCubitState(
      assetList: const [],
      loading: false,
    );
  }

  factory CryptoRecordsCubitState.loading() {
    return CryptoRecordsCubitState(
      loading: true,
        assetList: const []
    );
  }

  factory CryptoRecordsCubitState.failed() {
    return CryptoRecordsCubitState(
        loading: false,
        assetList: const []
    );
  }
}

enum CryptoRecordsCubitOperation{
  initial,fetch
}