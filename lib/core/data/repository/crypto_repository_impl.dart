
import 'package:cryptoinfo/core/data/model/search_response_model.dart';
import 'package:cryptoinfo/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../domain/respository/crypto_repository.dart';
import '../../error/exceptions.dart';
import '../../network/network_info.dart';
import '../datasource/crypto_remote_data_source.dart';


@LazySingleton(as: CryptoRepository)
class CollaborationRepositoryImpl implements CryptoRepository {
  final CryptoRemoteDataSource? remoteDataSource;
  final NetworkInfo? networkInfo;

  CollaborationRepositoryImpl({
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
