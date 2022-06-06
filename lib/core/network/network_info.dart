import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/mockito.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

@LazySingleton(as: NetworkInfo, env: [Environment.dev,Environment.prod])
class NetworkInfoImpl implements NetworkInfo {

  final InternetConnectionChecker? dataConnectionChecker;

  NetworkInfoImpl(this.dataConnectionChecker);

  @override
  Future<bool> get isConnected => dataConnectionChecker!.hasConnection;

}

@LazySingleton(as: NetworkInfo, env: [Environment.test])
class MockNetworkInfo extends Mock implements NetworkInfo {}