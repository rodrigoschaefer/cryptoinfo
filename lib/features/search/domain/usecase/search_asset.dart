
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';


import '../../../../core/data/model/search_response_model.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../respository/crypto_search_repository.dart';

@lazySingleton
class SearchAsset implements UseCase<SearchResponseModel, SearchParams> {
  final CryptoSearchRepository? cryptoRepository;

  SearchAsset({this.cryptoRepository});

  @override
  Future<Either<Failure, SearchResponseModel>> call(
      SearchParams params) async {
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