part of 'collaboration_cubit.dart';

@immutable
class CryptoCubitState extends Equatable {

  List<CoinModel>? coinList;
  bool loading;
  bool? failed;

  CryptoCubitState({this.coinList,this.loading = false,this.failed});

  CryptoCubitState copyWith({
    List<CoinModel>? coinList,
    bool? loading,
    bool? failed
  }) {
    return CryptoCubitState(
        coinList: coinList ?? this.coinList,
        loading: loading ?? this.loading,
        failed: failed ?? this.failed
    );
  }

  @override
  List<Object?> get props => [
    coinList,
    loading,
    failed
  ];

  factory CryptoCubitState.initial() {
    return CryptoCubitState(
      coinList: null,
      loading: false,
    );
  }

  factory CryptoCubitState.loading() {
    return CryptoCubitState(
      loading: true,
      coinList: null
    );
  }

  factory CryptoCubitState.failed() {
    return CryptoCubitState(
        loading: false,
        coinList: null
    );
  }
}

