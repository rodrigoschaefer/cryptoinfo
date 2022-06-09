import 'package:cryptoinfo/core/error/failures.dart';
import 'package:cryptoinfo/features/home/data/model/asset_record.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/exceptions.dart';
import '../../domain/respository/asset_records_repository.dart';

@LazySingleton(as: AssetRecordsRepository)
class AssetRecordsRepositoryImpl implements AssetRecordsRepository {

  AssetRecordsRepositoryImpl();

  @override
  Future<Either<Failure, List<AssetRecord>>> fetchAssets() async {
    try {
      //TODO: fetch records from local storage
      return Right([
        AssetRecord(name: 'Cardano',price: 0.56,symbol: 'ADA',currency: 'USD', thumbImageUrl: 'https://assets.coingecko.com/coins/images/975/thumb/cardano.png?1547034860'),
        AssetRecord(name: 'Solana',price: 0.26,symbol: 'SOL',currency: 'USD', thumbImageUrl: 'https://assets.coingecko.com/coins/images/4128/thumb/solana.png?1640133422'),
      ]);
    } on FetchException {
      return Left(FetchFailure());
    }

  }


}
