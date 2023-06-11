import 'package:get_it/get_it.dart';
import 'package:order_app/core/data/data_source/auth_data_source.dart';

import '../data/data_source/home_data_source.dart';

final getIt = GetIt.instance;

setUp() {
  getIt.registerLazySingleton<AuthDataSource>(() => AuthDataSource());
  getIt.registerLazySingleton<HomeDataSource>(() => HomeDataSource());
}
