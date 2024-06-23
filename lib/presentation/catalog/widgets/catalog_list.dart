import 'dart:async';
import 'dart:developer';

import 'package:bo_mart/common/constants/constants.dart';
import 'package:bo_mart/common/constants/styles.dart';
import 'package:bo_mart/common/utils/custom_page_controller.dart';
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

    pagingController.addStatusListener(_pagingStatusListener);
    pagingController.addPageRequestListener((pageKey) {
      ref
          .read(catalogNotifierProvider(pagingController).notifier)
          .fetchProducts(pageKey);
    });
    pagingController.refresh();
  }

  @override
  void dispose() {
    pagingController.removeStatusListener(_pagingStatusListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(catalogNotifierProvider(pagingController));

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
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  pagingController.error,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 45),
                SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      pagingController.refresh();
                    },
                    icon: const Icon(
                      Icons.refresh,
                    ),
                    label: const Text(
                      'Try Again',
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _pagingStatusListener(PagingStatus status) {
    log(status.name);
    if (status == PagingStatus.ongoing || status == PagingStatus.noItemsFound) {
      _completer?.complete();
      _completer == null;
    }
  }
}
