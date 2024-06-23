import 'dart:developer';

import 'package:bo_mart/domain/models/cart_item_modal.dart';
import 'package:bo_mart/domain/models/product.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart_provider.g.dart';

@riverpod
class CartNotifier extends _$CartNotifier {
  @override
  List<CartItemModal> build() {
    return [];
  }

  void addItem({
    required Product product,
    required int quantity,
  }) {
    log('addItem ${product.id} $quantity');

    final List<CartItemModal> items = List.from(state);
    final existingItemIndex = items.indexWhere(
      (item) => item.product.id == product.id,
    );

    if (existingItemIndex != -1) {
      items[existingItemIndex].quantity + quantity;
      log('item exists $existingItemIndex ${items[existingItemIndex].quantity + quantity}');
    } else {
      items.add(
        CartItemModal(product: product, quantity: quantity),
      );
      log('item does not exist');
    }

    state = items;
  }
}
