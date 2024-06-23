import 'package:bo_mart/common/constants/styles.dart';
import 'package:bo_mart/domain/models/cart_item_modal.dart';
import 'package:bo_mart/presentation/cart/widgets/total_display.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    required this.item,
    super.key,
  });

  final CartItemModal item;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
                        item.product.sku,
                        style: theme.textTheme.labelSmall!.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        '${item.product.stockQuantity} in stock',
                        style: theme.textTheme.labelSmall!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.green,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    item.product.name,
                    style: theme.textTheme.labelMedium,
                  ),
                  Text(
                    'RM 100.00',
                    style: theme.textTheme.labelLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            item.product.images.isNotEmpty
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(
                      AppRadius.r4,
                    ),
                    child: Image.network(
                      item.product.images[0].srcSmall,
                      height: 60,
                    ),
                  )
                : const SizedBox(
                    height: 60,
                  ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TotalDisplay(
              label: 'Order',
              value: '${item.quantity} UNIT',
              arrowIcon: true,
              borderColor: theme.colorScheme.primary,
            ),
            const SizedBox(width: 10),
            const TotalDisplay(
              label: 'Total',
              value: 'RM 100.00',
              borderColor: Colors.amber,
            ),
          ],
        ),
      ],
    );
  }
}
