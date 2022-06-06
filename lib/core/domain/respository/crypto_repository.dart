

import 'package:dartz/dartz.dart';

import '../../data/model/search_response_model.dart';
import '../../error/failures.dart';


abstract class CryptoRepository {
  Future<Either<Failure,SearchResponseModel>> searchCoin({required String partial});
}
