import 'package:bo_mart/app/app_dependencies.dart';
import 'package:bo_mart/data/responses/product_response.dart';
import 'package:bo_mart/domain/repository/product_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'catalog_provider.g.dart';

@riverpod
class CatalogNotifier extends _$CatalogNotifier {
  @override
  Future<ProductResponse?> build() async => null;

  Future<void> fetchProducts(int page) async {
    if (!state.isLoading) {
      state = const AsyncLoading();
    }

    if (page == 3) {
      await Future.delayed(const Duration(seconds: 3));
      state = AsyncError(Exception(), StackTrace.current);
      return;
    }

    final productRepository = getIt<ProductRepository>();
    late ProductResponse response;

    try {
      response = await productRepository.fetchProducts(page);
      state = AsyncData(response);
    } on Exception catch (e, s) {
      state = AsyncError(e, s);
    }
  }
}
