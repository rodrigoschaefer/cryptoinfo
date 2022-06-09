import 'package:get_it/get_it.dart';

import 'features/home/data/repository/asset_records_repository_impl.dart';
import 'features/home/domain/respository/asset_records_repository.dart';
import 'features/home/presentation/cubit/crypto_records_cubit.dart';
import 'features/home/usecases/fetch_asset_records.dart';
import 'features/search/domain/usecase/search_asset.dart';
import 'features/search/presentation/cubit/crypto_search_cubit.dart';

final getIt = GetIt.instance;

void configureModuleInjection() {

  getIt.registerLazySingleton<AssetRecordsRepository>(
        () => AssetRecordsRepositoryImpl(),
  );

  getIt.registerLazySingleton<SearchAsset>(() => SearchAsset());
  getIt.registerLazySingleton<FetchAssetRecords>(() => FetchAssetRecords(assetRecordsRepository: getIt()));

  getIt.registerSingleton<CryptoRecordsCubit>(CryptoRecordsCubit(fetchAssetRecords: getIt()));
  getIt.registerSingleton<CryptoSearchCubit>(CryptoSearchCubit(searchAsset: getIt()));

}
