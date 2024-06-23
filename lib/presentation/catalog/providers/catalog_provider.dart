import 'package:bo_mart/app/app_dependencies.dart';
import 'package:bo_mart/data/responses/product_response.dart';
import 'package:bo_mart/domain/models/product.dart';
import 'package:bo_mart/domain/repository/product_repository.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'catalog_provider.g.dart';

@riverpod
class CatalogNotifier extends _$CatalogNotifier {
  late PagingController<int, Product> _pagingController;
  int _totalPages = 0;
  // int _totalProducts = 0;
  int _currentPage = 1;

  @override
  Future<List<Product>?> build(
    PagingController<int, Product> controller,
  ) async {
    _pagingController = controller;
    _pagingController.addPageRequestListener(fetchProducts);
    ref.onDispose(() {
      _pagingController.removePageRequestListener(fetchProducts);
    });

    return null;
  }

  Future<void> fetchProducts(int page) async {
    if (!state.isLoading) {
      state = const AsyncLoading();
    }

    _currentPage = page;
    final productRepository = getIt<ProductRepository>();
    late ProductResponse response;

    try {
      response = await productRepository.fetchProducts(page);
    } on Exception catch (e, s) {
      _pagingController.error = e;
      state = AsyncError(e, s);
      return;
    }

    _totalPages = response.totalPages;

    if (_currentPage >= _totalPages) {
      _pagingController.appendLastPage(response.products);
    } else {
      _pagingController.appendPage(
        response.products,
        _currentPage + 1,
      );
    }

    state = AsyncData(response.products);
  }
}
