import 'package:get_it/get_it.dart';
import 'package:waster/core/networking/dio_helper.dart';
import 'package:waster/core/utils/secure_storage_helper.dart';

GetIt sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerLazySingleton<SecureStorageHelper>(() => SecureStorageHelper());
  sl.registerLazySingleton<DioHelper>(() => DioHelper());
}
