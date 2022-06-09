
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../data/model/asset_record.dart';
import '../domain/respository/asset_records_repository.dart';

@lazySingleton
class FetchAssetRecords implements UseCase<List<AssetRecord>, NoParams> {
  final AssetRecordsRepository? assetRecordsRepository;

  FetchAssetRecords({this.assetRecordsRepository});

  @override
  Future<Either<Failure, List<AssetRecord>>> call(
      NoParams params) async {
    final result = await assetRecordsRepository!.fetchAssets();
    return result;
  }
}
