import 'package:bo_mart/app/app_router.dart';
import 'package:bo_mart/common/constants/styles.dart';
import 'package:bo_mart/common/widgets/custom_app_bar.dart';
import 'package:bo_mart/presentation/catalog/widgets/catalog_item.dart';
import 'package:bo_mart/presentation/catalog/widgets/catalog_search.dart';
import 'package:flutter/material.dart';

enum SampleItem { itemOne, itemTwo, itemThree }

class CatalogView extends StatefulWidget {
  const CatalogView({super.key});

  @override
  State<CatalogView> createState() => _CatalogViewState();
}

class _CatalogViewState extends State<CatalogView> {
  SampleItem? selectedItem;

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
                const Expanded(
                  child: CatalogSearch(),
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
            child: productList(),
          )
        ],
      ),
    );
  }

  Widget productList() {
    const int length = 4;
    return Container(
      // color: Colors.white,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p15,
        ),
        itemCount: length + 1,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (context, index) {
          /// if last item return nothing
          if (index == length) {
            return const SizedBox.shrink();
          }

          return const CatalogItem();
        },
      ),
    );
  }
}
