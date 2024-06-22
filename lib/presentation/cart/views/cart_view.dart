import 'package:bo_mart/common/constants/styles.dart';
import 'package:bo_mart/common/widgets/custom_app_bar.dart';
import 'package:bo_mart/presentation/cart/widgets/cart_list.dart';
import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: const CustomAppBar(titleText: 'Cart'),
      body: Container(
        color: AppColors.grey,
        child: CustomScrollView(
          slivers: [
            CartList(
              items: List.generate(10, (i) => i),
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
      bottomNavigationBar: Container(
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
                    'Total (3)',
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
