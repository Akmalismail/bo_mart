import 'package:bo_mart/app/app_router.dart';
import 'package:bo_mart/common/constants/styles.dart';
import 'package:bo_mart/common/widgets/custom_app_bar.dart';
import 'package:bo_mart/domain/models/product.dart';
import 'package:bo_mart/presentation/catalog/widgets/catalog_list.dart';
import 'package:bo_mart/presentation/catalog/widgets/catalog_search.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class CatalogView extends StatefulWidget {
  const CatalogView({super.key});

  @override
  State<CatalogView> createState() => _CatalogViewState();
}

class _CatalogViewState extends State<CatalogView> {
  final pagingController = PagingController<int, Product>(
    firstPageKey: 1,
  );
  final searchFieldController = TextEditingController();

  @override
  void initState() {
    super.initState();

    pagingController.addPageRequestListener((pageKey) {
      //  start load here
    });
    pagingController.refresh();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: const CustomAppBar(titleText: 'Categories Name'),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p15,
              vertical: AppPadding.p10,
            ),
            child: Row(
              children: [
                Expanded(
                  child: CatalogSearch(
                    controller: searchFieldController,
                    onChanged: (text) {},
                  ),
                ),
                Badge.count(
                  count: 3,
                  alignment: Alignment.topRight,
                  offset: const Offset(-4, 4),
                  child: IconButton(
                    style: IconButton.styleFrom(
                      backgroundColor: theme.colorScheme.onPrimary,
                      foregroundColor: theme.colorScheme.inverseSurface,
                    ),
                    icon: const Icon(
                      Icons.shopping_cart_outlined,
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed(Routes.cartView);
                    },
                  ),
                )
              ],
            ),
          ),
          Expanded(
              child: CatalogList(
            pagingController: pagingController,
            searchTerm: searchFieldController.text,
          ))
        ],
      ),
    );
  }
}
