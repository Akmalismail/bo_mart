import 'package:bo_mart/common/constants/styles.dart';
import 'package:bo_mart/common/widgets/custom_app_bar.dart';
import 'package:bo_mart/presentation/cart/provider/cart_provider.dart';
import 'package:bo_mart/presentation/cart/widgets/cart_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartView extends ConsumerWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final cartItems = ref.watch(cartNotifierProvider);

    return Scaffold(
      appBar: const CustomAppBar(titleText: 'Cart'),
      body: cartItems.isEmpty
          ? SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Your cart is empty!',
                    style: theme.textTheme.titleLarge,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'You have no items in your cart.\nGo ahead and browse our catalog',
                    style: theme.textTheme.titleSmall,
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Continue Browsing'),
                  )
                ],
              ),
            )
          : Container(
              color: AppColors.grey,
              child: CustomScrollView(
                slivers: [
                  CartList(
                    items: cartItems,
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
                        const Text(
                          'RM 500.00',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Checkout'),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
