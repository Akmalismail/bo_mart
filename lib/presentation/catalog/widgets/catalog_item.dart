import 'package:bo_mart/common/constants/styles.dart';
import 'package:bo_mart/common/utils/extensions.dart';
import 'package:bo_mart/domain/models/product.dart';
import 'package:bo_mart/presentation/cart/provider/cart_provider.dart';
import 'package:bo_mart/presentation/catalog/providers/item_quantity_provider.dart';
import 'package:bo_mart/presentation/catalog/widgets/item_quantity_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CatalogItem extends ConsumerWidget {
  const CatalogItem({
    required this.product,
    super.key,
  });

  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final quantity = ref.watch(itemQuantityNotifierProvider(product));

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        product.sku,
                        style: theme.textTheme.labelSmall!.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        '${product.stockQuantity} in stock',
                        style: theme.textTheme.labelSmall!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.green,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    product.name,
                    style: theme.textTheme.labelMedium,
                  ),
                  Text(
                    'RM ${double.parse(product.regularPrice).toStringAsFixed(2)}',
                    style: theme.textTheme.labelLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            product.images.isNotEmpty
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(
                      AppRadius.r4,
                    ),
                    child: Image.network(
                      product.images[0].srcSmall,
                      height: 60,
                    ),
                  )
                : const SizedBox(
                    height: 60,
                  ),
          ],
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 35,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: theme.borderColor,
                  ),
                ),
                child: Row(
                  children: [
                    TextButton(
                        style: TextButton.styleFrom(
                          shape: const RoundedRectangleBorder(),
                          foregroundColor: theme.colorScheme.inverseSurface,
                        ),
                        onPressed: () {},
                        child: const Text(
                          'UNIT',
                        )),
                    VerticalDivider(
                      color: theme.borderColor,
                      width: 0,
                    ),
                    ItemQuantitySelector(
                      product: product,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              LayoutBuilder(
                builder: (_, constraints) => SizedBox.square(
                  dimension: constraints.maxHeight,
                  child: IconButton(
                    iconSize: 18,
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      ref.read(cartNotifierProvider.notifier).addItem(
                            product: product,
                            quantity: quantity,
                          );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            backgroundColor: AppColors.green,
                            content: Text(
                              '${product.name} ($quantity) has been added to cart!',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
