import 'dart:convert';
import 'dart:developer';

import 'package:injectable/injectable.dart';

import '../model/search_response_model.dart';
import 'base_remote_data_source.dart';
import 'package:cryptoinfo/core/network/ci_http_client.dart' as http;

abstract class CryptoRemoteDataSource {

  Future<SearchResponseModel> searchCoin({required String partial});

}

@LazySingleton(as: CryptoRemoteDataSource, env: [Environment.dev, Environment.prod])
class CollaborationsRemoteDataSourceImpl extends BaseRemoteDataSource implements CryptoRemoteDataSource {

  static String host = 'https://api.coingecko.com';

  @override
  Future<SearchResponseModel> searchCoin({required String partial}) async {
    var queryString = '/api/v3/search?query=$partial';
    final path = Uri.https(host, queryString);
    var headers = getRequestHeader();
    var response = await http.get(path, headers: headers);
    log('BCMApi getExternalNetworks response statusCode: ${response.statusCode} body: ${response.body}');
    if (response.statusCode != HTTP_SUCCESS) {
      checkResponseError(response.statusCode);
    }
    Map userMap = jsonDecode(response.body);
    return SearchResponseModel.fromJson(userMap as Map<String, dynamic>);
  }
}
