import 'package:get_it/get_it.dart';

import 'package:fut_chemistry/state/app_state.dart';
import 'package:fut_chemistry/services/storage_service/storage_service.dart';

final getIt = GetIt.instance;

void initGetIt() {
  getIt.registerLazySingleton<FutAppState>(() => FutAppState());
  getIt.registerLazySingleton<StorageService>(() => StorageService());
}