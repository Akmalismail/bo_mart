import 'package:bo_mart/data/remote/api_client.dart';
import 'package:bo_mart/domain/repository/product_repository.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.I;

Future<void> setupAppDependencies() async {
  /// .env
  await dotenv.load();

  /// api client
  final client = await ApiClient.initialize();
  getIt.registerLazySingleton<ApiClient>(() => client);

  /// repositories
  /// api client
  getIt.registerLazySingleton<ProductRepository>(
    () => ProductRepository(
      getIt(),
    ),
  );
}
