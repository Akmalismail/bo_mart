import 'package:bo_mart/common/constants/styles.dart';
import 'package:bo_mart/domain/models/cart_item_modal.dart';
import 'package:bo_mart/presentation/cart/provider/cart_provider.dart';
import 'package:bo_mart/presentation/cart/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartList extends ConsumerWidget {
  const CartList({
    required this.items,
    super.key,
  });

  final List<CartItemModal> items;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData theme = Theme.of(context);
    final cartItems = ref.watch(cartNotifierProvider);

    return DecoratedSliver(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
      ),
      sliver: SliverPadding(
        padding: const EdgeInsets.symmetric(
          vertical: AppPadding.p10,
          horizontal: AppPadding.p15,
        ),
        sliver: SliverList.separated(
          itemCount: cartItems.length + 1,
          separatorBuilder: (_, __) => const Divider(),
          itemBuilder: (context, index) {
            /// if last item return nothing
            if (index == items.length) {
              return const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total'),
                  Text(
                    'RM 500.00',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              );
            }

            return CartItem(
              item: items[index],
            );
          },
        ),
      ),
    );
  }
}
