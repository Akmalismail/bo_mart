import 'dart:async';

import 'package:bo_mart/presentation/catalog/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

class ItemQuantitySelector extends StatefulWidget {
  const ItemQuantitySelector({
    super.key,
  });

  @override
  State<ItemQuantitySelector> createState() => _ItemQuantitySelectorState();
}

class _ItemQuantitySelectorState extends State<ItemQuantitySelector> {
  int quantity = 1;
  Timer? timer;

  @override
  Widget build(BuildContext context) {
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

              setState(() {
                quantity--;
              });
            },
          ),
          Text(quantity.toString()),
          CustomIconButton(
            icon: Icons.add,
            onTap: () {
              setState(() {
                quantity++;
              });
            },
          ),
        ],
      ),
    );
  }
}
