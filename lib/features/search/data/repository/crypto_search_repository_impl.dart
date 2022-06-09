
import 'package:cryptoinfo/core/data/model/search_response_model.dart';
import 'package:cryptoinfo/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/respository/crypto_search_repository.dart';
import '../datasource/crypto_search_remote_data_source.dart';




@LazySingleton(as: CryptoSearchRepository)
class CryptoSearchRepositoryImpl implements CryptoSearchRepository {
  final CryptoSearchRemoteDataSource? remoteDataSource;
  final NetworkInfo? networkInfo;

  CryptoSearchRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, SearchResponseModel>> searchCoin({required String partial}) async {
    if (!await networkInfo!.isConnected) return Left(ConnectionFailure());
    try {
      var response = await remoteDataSource!.searchCoin(
        partial: partial
      );
      return Right(response);
    } on NotFoundException {
      return Left(UserNotFoundFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

}
