import 'package:bo_mart/common/constants/styles.dart';
import 'package:bo_mart/common/utils/extensions.dart';
import 'package:bo_mart/common/utils/helper.dart';
import 'package:bo_mart/domain/models/product.dart';
import 'package:bo_mart/presentation/cart/provider/cart_provider.dart';
import 'package:bo_mart/presentation/catalog/providers/item_quantity_provider.dart';
import 'package:bo_mart/presentation/catalog/widgets/item_quantity_selector.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CatalogItem extends ConsumerStatefulWidget {
  const CatalogItem({
    required this.product,
    super.key,
  });

  final Product product;

  @override
  ConsumerState<CatalogItem> createState() => _CatalogItemState();
}

class _CatalogItemState extends ConsumerState<CatalogItem> {
  /// Product
  Product get product => widget.product;

  /// Variations
  bool get isVariationVisible {
    return product.attributes
            ?.firstWhereOrNull((attribute) => attribute.name == 'UOM')
            ?.visible ==
        true;
  }

  List<Product>? get variations => product.variations;
  late Product _variation;
  Product get variation => _variation;
  set variation(Product value) {
    if (_variation != value) {
      setState(() {
        _variation = value;
      });
    }
  }

  /// Stock
  int get stock => calculateStock(variation, product);

  /// UOM
  List<String>? get uom {
    final options = product.attributes
        ?.firstWhereOrNull((attribute) => attribute.name == 'UOM')
        ?.options;

    return options;
  }

  @override
  void initState() {
    super.initState();
    _variation =
        isVariationVisible && variations != null ? variations![0] : product;
  }

  @override
  Widget build(BuildContext context) {
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
                        '$stock in stock',
                        style: theme.textTheme.labelSmall!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.green,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    product.name ?? '',
                    style: theme.textTheme.labelMedium,
                  ),
                  Text(
                    'RM ${double.parse(variation.regularPrice).toStringAsFixed(2)}',
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
                      errorBuilder: (_, __, ___) {
                        return const SizedBox.shrink();
                      },
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
                    if (isVariationVisible)
                      MenuAnchor(
                        menuChildren: variations == null
                            ? []
                            : variations!
                                .map(
                                  (v) => MenuItemButton(
                                    onPressed: () {
                                      variation = v;
                                      ref
                                          .read(cartNotifierProvider.notifier)
                                          .changeItem(
                                            product: product,
                                            variation: variation,
                                          );
                                    },
                                    child: Text(
                                      v.sku,
                                    ),
                                  ),
                                )
                                .toList(),
                        builder: (_, controller, __) {
                          return TextButton(
                            style: TextButton.styleFrom(
                              shape: const RoundedRectangleBorder(),
                              foregroundColor: theme.colorScheme.inverseSurface,
                            ),
                            onPressed: () {
                              if (controller.isOpen) {
                                controller.close();
                              } else {
                                controller.open();
                              }
                            },
                            child: Text(
                              uom?.firstWhereOrNull(
                                    (unit) =>
                                        unit.isNotEmpty &&
                                        variation.sku.endsWith(unit),
                                  ) ??
                                  'UNIT',
                            ),
                          );
                        },
                      ),
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
                            variation: variation,
                          );

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: AppColors.green,
                          content: Text(
                            '${product.name} (${variation.sku}) ($quantity) has been added to cart!',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
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
