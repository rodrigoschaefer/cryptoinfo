
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../data/model/search_response_model.dart';
import '../../error/failures.dart';
import '../../usecases/usecase.dart';
import '../respository/crypto_repository.dart';

@lazySingleton
class SearchAsset implements UseCase<SearchResponseModel, SearchParams> {
  final CryptoRepository? cryptoRepository;

  SearchAsset({this.cryptoRepository});

  @override
  Future<Either<Failure, SearchResponseModel>> call(
      SearchParams params) async {
    //TODO: migrate user repository
    final result = await cryptoRepository!.searchCoin(partial: params.partial);
    return result;
  }
}


class SearchParams extends Equatable {

  final String partial;

  const SearchParams({required this.partial});

  @override
  List<Object?> get props => [partial];

}