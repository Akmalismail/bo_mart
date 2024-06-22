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
      appBar: AppBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox.square(
              dimension: 40,
              child: BackButton(
                style: IconButton.styleFrom(
                  iconSize: 16,
                ),
              ),
            ),
            Expanded(
              child: Text(
                'Categories Name',
                style: theme.textTheme.titleMedium!.copyWith(
                  color: theme.colorScheme.onPrimary,
                ),
              ),
            ),
          ],
        ),
        actions: [
          Text(
            'Company Name',
            style: theme.textTheme.labelMedium!.copyWith(
              color: theme.colorScheme.onPrimary,
            ),
          ),
          const SizedBox(width: 5),
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: theme.colorScheme.onPrimary,
              shape: BoxShape.circle,
            ),
            child: Text(
              'CN',
              style: TextStyle(
                color: theme.colorScheme.primary,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        child: Column(
          children: [
            Row(
              children: [
                const Expanded(
                  child: CatalogSearch(),
                ),
                Badge.count(
                  count: 3,
                  alignment: Alignment.topRight,
                  offset: const Offset(-4, 4),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.shopping_cart_outlined,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: productList(),
            )
          ],
        ),
      ),
    );
  }

  Widget productList() {
    const int length = 4;
    return ListView.separated(
      itemCount: length + 1,
      separatorBuilder: (_, __) => const Divider(),
      itemBuilder: (context, index) {
        /// if last item return nothing
        if (index == length) {
          return const SizedBox.shrink();
        }

        return const CatalogItem();
      },
    );
  }
}
