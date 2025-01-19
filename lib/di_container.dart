import 'package:appwrite/appwrite.dart';
import 'package:get_it/get_it.dart';
import 'constants/api_constants.dart';
import 'data/repositories/irem_repository_impl.dart';
import 'data/sources/appwrite_service.dart';
import 'domain/repositories/item_repository.dart';
import 'domain/usecases/fetch_items_use_case.dart';
import 'presentation/cubit/item_cubit.dart';

final sl = GetIt.instance;

void init() {
  // Appwrite Client
  sl.registerLazySingleton<Client>(() => Client()
    ..setEndpoint(ApiConstants.baseUrl)
    ..setProject(ApiConstants.projectId));

  // Appwrite Databases Service
  sl.registerLazySingleton<Databases>(() => Databases(sl<Client>()));

  // AppwriteService
  sl.registerLazySingleton<AppwriteService>(() => AppwriteService(sl<Databases>()));

  // Repository
  sl.registerLazySingleton<ItemRepository>(() => ItemRepositoryImpl(sl<AppwriteService>()));

  // Use Cases
  sl.registerLazySingleton(() => FetchItemsUseCase(sl<ItemRepository>()));

  // Cubit
  sl.registerFactory(() => ItemCubit(sl<FetchItemsUseCase>()));
}