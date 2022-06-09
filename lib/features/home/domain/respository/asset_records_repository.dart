

import 'package:cryptoinfo/features/home/data/model/asset_record.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';


abstract class AssetRecordsRepository {
  Future<Either<Failure,List<AssetRecord>>> fetchAssets();
}
