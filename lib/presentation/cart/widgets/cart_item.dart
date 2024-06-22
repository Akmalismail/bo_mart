import 'package:bo_mart/common/constants/styles.dart';
import 'package:bo_mart/presentation/cart/widgets/total_display.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
  });

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
                        'SKU_12345',
                        style: theme.textTheme.labelSmall!.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        '100 in stock',
                        style: theme.textTheme.labelSmall!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.green,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Product name',
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
            ClipRRect(
              borderRadius: BorderRadius.circular(
                AppRadius.r4,
              ),
              child: Image.network(
                'https://picsum.photos/75',
                height: 40,
              ),
            )
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TotalDisplay(
              label: 'Order',
              value: '2 UNIT',
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
