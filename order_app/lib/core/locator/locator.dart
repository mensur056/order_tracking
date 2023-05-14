import 'package:get_it/get_it.dart';
import 'package:order_app/core/data/data_source/auth_data_source.dart';

final getIt = GetIt.instance;

setUp() {
  getIt.registerLazySingleton<AuthDataSource>(() => AuthDataSource());
}
