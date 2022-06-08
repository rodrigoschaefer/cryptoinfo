import 'package:get_it/get_it.dart';

import 'core/domain/usecase/search_asset.dart';
import 'features/home/presentation/cubit/crypto_cubit.dart';

final getIt = GetIt.instance;

void configureModuleInjection() {

  getIt.registerLazySingleton<SearchAsset>(() => SearchAsset());

  getIt.registerSingleton<CryptoCubit>(CryptoCubit(searchAsset: getIt()));

}
