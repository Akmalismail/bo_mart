import 'package:bo_mart/domain/models/product.dart';
import 'package:bo_mart/presentation/catalog/providers/item_quantity_provider.dart';
import 'package:bo_mart/presentation/catalog/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ItemQuantitySelector extends ConsumerStatefulWidget {
  const ItemQuantitySelector({
    required this.product,
    super.key,
  });

  final Product product;

  @override
  ConsumerState<ItemQuantitySelector> createState() =>
      _ItemQuantitySelectorState();
}

class _ItemQuantitySelectorState extends ConsumerState<ItemQuantitySelector> {
  @override
  Widget build(BuildContext context) {
    final provider = itemQuantityNotifierProvider(widget.product);
    final quantity = ref.watch(provider);

    return SizedBox(
      width: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomIconButton(
            icon: Icons.remove,
            onTap: () {
              if (quantity == 1) {
                return;
              }

              ref.read(provider.notifier).decrement();
            },
          ),
          Text(quantity.toString()),
          CustomIconButton(
            icon: Icons.add,
            onTap: () {
              ref.read(provider.notifier).increment();
            },
          ),
        ],
      ),
    );
  }
}
