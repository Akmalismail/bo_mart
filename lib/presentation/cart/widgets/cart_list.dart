import 'package:bo_mart/common/constants/styles.dart';
import 'package:bo_mart/presentation/cart/widgets/cart_item.dart';
import 'package:flutter/material.dart';

class CartList extends StatelessWidget {
  const CartList({
    required this.items,
    super.key,
  });

  final List items;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

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
          itemCount: items.length + 1,
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

            return const CartItem();
          },
        ),
      ),
    );
  }
}
