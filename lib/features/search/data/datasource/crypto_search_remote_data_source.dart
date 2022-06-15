import 'dart:convert';
import 'dart:developer';

import 'package:injectable/injectable.dart';

import '../../../../core/data/model/search_response_model.dart';
import '../../../../core/data/datasource/base_remote_data_source.dart';
import 'package:cryptoinfo/core/network/ci_http_client.dart' as http;

abstract class CryptoSearchRemoteDataSource {
  Future<SearchResponseModel> searchCoin({required String partial});
}

@LazySingleton(
    as: CryptoSearchRemoteDataSource, env: [Environment.dev, Environment.prod])
class CryptoSearchRemoteDataSourceImpl extends BaseRemoteDataSource
    implements CryptoSearchRemoteDataSource {
  static String host = 'https://api.coingecko.com';
  var client = http.Client();

  @override
  Future<SearchResponseModel> searchCoin({required String partial}) async {
    var queryString = '/api/v3/search?query=$partial';
    final path = Uri.parse(host + queryString);
    var headers = getRequestHeader();
    var response = await client.get(path, headers: headers);
    log('BCMApi searchCoin response statusCode: ${response.statusCode}');
    if (response.statusCode != HTTP_SUCCESS) {
      checkResponseError(response.statusCode);
    }
    Map userMap = jsonDecode(response.body);
    return SearchResponseModel.fromJson(userMap as Map<String, dynamic>);
  }
}
