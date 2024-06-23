import 'package:bo_mart/common/constants/constants.dart';
import 'package:bo_mart/common/constants/styles.dart';
import 'package:bo_mart/domain/models/product.dart';
import 'package:bo_mart/presentation/catalog/widgets/catalog_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class CatalogList extends StatefulWidget {
  const CatalogList({
    required this.pagingController,
    this.searchTerm,
    super.key,
  });

  final PagingController<int, Product> pagingController;
  final String? searchTerm;

  @override
  State<CatalogList> createState() => _CatalogListState();
}

class _CatalogListState extends State<CatalogList> {
  PagingController<int, Product> get pagingController =>
      widget.pagingController;
  String get searchTerm => widget.searchTerm ?? '';

  @override
  Widget build(BuildContext context) {
    return PagedListView<int, Product>.separated(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p15,
      ),
      pagingController: pagingController,
      separatorBuilder: (_, __) => const Divider(),
      builderDelegate: PagedChildBuilderDelegate(
        itemBuilder: (_, product, index) {
          if (widget.searchTerm != null &&
              product.toJson().values.toList().indexWhere(
                        (value) => value
                            .toString()
                            .toLowerCase()
                            .contains(widget.searchTerm!.toLowerCase()),
                      ) <
                  0) {
            return const SizedBox.shrink();
          }

          return CatalogItem(
            product: product,
          ).animate().fadeIn(
                delay: Duration(milliseconds: 50 * index),
                duration: Constants.fadeInOutDuration,
                curve: Curves.decelerate,
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
    );
  }
}
