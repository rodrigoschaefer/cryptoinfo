

import 'package:dartz/dartz.dart';

import '../../../../core/data/model/search_response_model.dart';
import '../../../../core/error/failures.dart';


abstract class CryptoSearchRepository {
  Future<Either<Failure,SearchResponseModel>> searchCoin({required String partial});
}
