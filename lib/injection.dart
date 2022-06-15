import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'core/network/network_info.dart';
import 'features/home/data/repository/asset_records_repository_impl.dart';
import 'features/home/domain/respository/asset_records_repository.dart';
import 'features/home/presentation/cubit/crypto_records_cubit.dart';
import 'features/home/usecases/fetch_asset_records.dart';
import 'features/search/data/datasource/crypto_search_remote_data_source.dart';
import 'features/search/data/repository/crypto_search_repository_impl.dart';
import 'features/search/domain/respository/crypto_search_repository.dart';
import 'features/search/domain/usecase/search_asset.dart';
import 'features/search/presentation/cubit/crypto_search_cubit.dart';

final getIt = GetIt.instance;

void configureModuleInjection() {

  getIt.registerLazySingleton<InternetConnectionChecker>(() => InternetConnectionChecker());
  getIt.registerLazySingleton<CryptoSearchRemoteDataSource>(() => CryptoSearchRemoteDataSourceImpl());
  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(getIt()));
  getIt.registerLazySingleton<AssetRecordsRepository>(
        () => AssetRecordsRepositoryImpl(),
  );

  getIt.registerLazySingleton<CryptoSearchRepository>(
        () => CryptoSearchRepositoryImpl(networkInfo: getIt(), remoteDataSource: getIt()),
  );

  getIt.registerLazySingleton<SearchAsset>(() => SearchAsset(cryptoRepository: getIt()));
  getIt.registerLazySingleton<FetchAssetRecords>(() => FetchAssetRecords(assetRecordsRepository: getIt()));

  getIt.registerSingleton<CryptoRecordsCubit>(CryptoRecordsCubit(fetchAssetRecords: getIt()));
  getIt.registerSingleton<CryptoSearchCubit>(CryptoSearchCubit(searchAsset: getIt()));

}
