import 'package:bo_mart/app/app_router.dart';
import 'package:bo_mart/common/constants/styles.dart';
import 'package:bo_mart/common/utils/custom_page_controller.dart';
import 'package:bo_mart/common/utils/debouncer.dart';
import 'package:bo_mart/common/widgets/custom_app_bar.dart';
import 'package:bo_mart/domain/models/product.dart';
import 'package:bo_mart/presentation/cart/provider/cart_provider.dart';
import 'package:bo_mart/presentation/catalog/widgets/catalog_list.dart';
import 'package:bo_mart/presentation/catalog/widgets/catalog_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CatalogView extends StatefulWidget {
  const CatalogView({super.key});

  @override
  State<CatalogView> createState() => _CatalogViewState();
}

class _CatalogViewState extends State<CatalogView> {
  final pagingController = CustomPagingController<int, Product>(
    firstPageKey: 1,
    invisibleItemsThreshold: 1,
  );
  final debouncer = Debouncer();
  String searchText = '';

  @override
  void dispose() {
    pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: CustomAppBar(
        titleText: 'Categories Name',
        menu: [
          MenuItemButton(
            child: const Text('Clear Cache'),
            onPressed: () async {
              final prefs = await SharedPreferences.getInstance();
              await prefs.clear();
            },
          ),
        ],
      ),
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
                    onChanged: (text) {
                      debouncer.run(() {
                        setState(() {
                          searchText = text;
                        });
                      });
                    },
                  ),
                ),
                Consumer(
                  builder: (_, ref, __) {
                    final cartItems = ref.watch(cartNotifierProvider);

                    return Badge.count(
                      count: cartItems.length,
                      isLabelVisible: cartItems.isNotEmpty,
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
                    );
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: CatalogList(
              pagingController: pagingController,
              searchText: searchText,
            ),
          ),
        ],
      ),
    );
  }
}
