part of 'crypto_search_cubit.dart';

@immutable
class CryptoSearchCubitState extends Equatable {

  CryptoCubitOperation cryptoCubitOperation;
  List<CoinModel>? coinList;
  bool loading;
  bool? failed;

  CryptoSearchCubitState({this.coinList,this.loading = false,this.failed,this.cryptoCubitOperation = CryptoCubitOperation.initial});

  CryptoSearchCubitState copyWith({
    List<CoinModel>? coinList,
    bool? loading,
    bool? failed,
    CryptoCubitOperation? cryptoCubitOperation
  }) {
    return CryptoSearchCubitState(
        coinList: coinList ?? this.coinList,
        loading: loading ?? this.loading,
        failed: failed ?? this.failed,
        cryptoCubitOperation: cryptoCubitOperation ?? this.cryptoCubitOperation
    );
  }

  @override
  List<Object?> get props => [
    coinList,
    loading,
    failed,
    cryptoCubitOperation
  ];

  factory CryptoSearchCubitState.initial() {
    return CryptoSearchCubitState(
      coinList: null,
      loading: false,
    );
  }

  factory CryptoSearchCubitState.search(List<CoinModel> coins) {
    return CryptoSearchCubitState(
      coinList: coins,
      loading: false,
      cryptoCubitOperation: CryptoCubitOperation.search
    );
  }

  factory CryptoSearchCubitState.loading() {
    return CryptoSearchCubitState(
      loading: true,
      coinList: null
    );
  }

  factory CryptoSearchCubitState.failed() {
    return CryptoSearchCubitState(
        loading: false,
        coinList: null
    );
  }
}

enum CryptoCubitOperation{
  initial,search
}