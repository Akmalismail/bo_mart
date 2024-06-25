import 'dart:async';

import 'package:bo_mart/common/constants/constants.dart';
import 'package:bo_mart/common/constants/styles.dart';
import 'package:bo_mart/common/utils/custom_page_controller.dart';
import 'package:bo_mart/common/widgets/full_screen_message.dart';
import 'package:bo_mart/domain/models/product.dart';
import 'package:bo_mart/presentation/catalog/providers/catalog_provider.dart';
import 'package:bo_mart/presentation/catalog/widgets/catalog_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class CatalogList extends ConsumerStatefulWidget {
  const CatalogList({
    required this.pagingController,
    this.searchText,
    super.key,
  });

  final CustomPagingController<int, Product> pagingController;
  final String? searchText;

  @override
  ConsumerState<CatalogList> createState() => _CatalogListState();
}

class _CatalogListState extends ConsumerState<CatalogList> {
  CustomPagingController<int, Product> get pagingController =>
      widget.pagingController;
  String get searchText => widget.searchText ?? '';
  Completer<void>? _completer;

  @override
  void initState() {
    super.initState();
    pagingController.addPageRequestListener(_fetchProducts);
  }

  @override
  void dispose() {
    pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = catalogNotifierProvider;
    ref.watch(provider);
    ref.listen(provider, (_, next) {
      if ((next is AsyncData || next is AsyncError) &&
          _completer != null &&
          !_completer!.isCompleted) {
        _completer!.complete();
      }

      switch (next) {
        case AsyncData(:final value?):
          if (value.currentPage >= value.totalPages) {
            pagingController.appendLastPage(value.products);
          } else {
            pagingController.appendPage(
              value.products,
              value.currentPage + 1,
            );
          }
          break;
        case AsyncError(:final error):
          pagingController.error = error;
          break;
      }
    });

    return RefreshIndicator(
      onRefresh: () async {
        pagingController.refresh(background: true);
        _completer = Completer();
        return await _completer?.future;
      },
      child: PagedListView<int, Product>(
        padding: EdgeInsets.only(
          left: AppPadding.p15,
          right: AppPadding.p15,
          bottom: MediaQuery.of(context).padding.bottom,
        ),
        pagingController: pagingController,
        builderDelegate: PagedChildBuilderDelegate(
          itemBuilder: (_, product, index) {
            if (searchText.isNotEmpty &&
                product.toJson().values.toList().indexWhere(
                          (value) => value
                              .toString()
                              .toLowerCase()
                              .contains(searchText.toLowerCase()),
                        ) <
                    0) {
              return const SizedBox.shrink();
            }

            return Column(
              children: [
                CatalogItem(
                  product: product,
                ).animate().fadeIn(
                      duration: Constants.fadeInOutDuration,
                      curve: Curves.decelerate,
                    ),
                const Divider(),
              ],
            );
          },
          noItemsFoundIndicatorBuilder: (_) {
            return const Center(
              child: Text('No products found'),
            );
          },
          firstPageProgressIndicatorBuilder: (_) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
          firstPageErrorIndicatorBuilder: (_) {
            return FullScreenMessage(
              title: 'Uh oh!',
              message:
                  'Looks like there was a problem retrieving our products.\nPlease try again later.',
              buttonText: 'Try Again',
              buttonIcon: Icons.refresh,
              onButtonPressed: () {
                pagingController.refresh();
              },
            );
          },
        ),
      ),
    );
  }

  void _fetchProducts(int pageKey) {
    ref.read(catalogNotifierProvider.notifier).fetchProducts(pageKey);
  }
}
