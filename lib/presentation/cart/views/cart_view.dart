import 'package:bo_mart/common/constants/styles.dart';
import 'package:bo_mart/common/widgets/custom_app_bar.dart';
import 'package:bo_mart/common/widgets/full_screen_message.dart';
import 'package:bo_mart/domain/models/cart_item_model.dart';
import 'package:bo_mart/presentation/cart/provider/cart_provider.dart';
import 'package:bo_mart/presentation/cart/widgets/cart_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartView extends ConsumerWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final List<CartItemModel> cartItems = ref.watch(cartNotifierProvider);
    final double totalPrice = cartItems.fold(0, (previousValue, element) {
      double price = double.parse(element.variation.regularPrice);
      return previousValue + price * element.quantity;
    });

    return Scaffold(
      appBar: CustomAppBar(
        titleText: 'Cart',
        menu: cartItems.isNotEmpty
            ? [
                MenuItemButton(
                  child: const Text('Clear cart'),
                  onPressed: () {
                    ref.read(cartNotifierProvider.notifier).clearCart();
                  },
                ),
              ]
            : null,
      ),
      body: cartItems.isEmpty
          ? FullScreenMessage(
              title: 'Your cart is empty!',
              message:
                  'You have no items in your cart.\nGo ahead and browse our catalog',
              buttonText: 'Continue Browsing',
              onButtonPressed: () {
                Navigator.of(context).pop();
              },
            )
          : Container(
              color: AppColors.grey,
              child: CustomScrollView(
                slivers: [
                  CartList(
                    items: cartItems,
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      color: theme.colorScheme.onPrimary,
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppPadding.p15,
                        vertical: AppPadding.p10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Total'),
                          Text(
                            'RM ${totalPrice.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const DecoratedSliver(
                    decoration: BoxDecoration(
                      color: AppColors.grey,
                    ),
                    sliver: SliverFillRemaining(
                      hasScrollBody: false,
                      child: SizedBox.shrink(),
                    ),
                  ),
                ],
              ),
            ),
      bottomNavigationBar: cartItems.isEmpty
          ? null
          : Container(
              padding: const EdgeInsets.only(
                top: 10,
                left: 15,
                right: 15,
              ),
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                border: Border(
                  top: Divider.createBorderSide(context),
                ),
              ),
              child: SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total (${cartItems.length})',
                          style: theme.textTheme.bodySmall!.copyWith(
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'RM ${totalPrice.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Checkout'),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
