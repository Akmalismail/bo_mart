import 'dart:developer';

import 'package:bo_mart/domain/models/cart_item_model.dart';
import 'package:bo_mart/domain/models/product.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart_provider.g.dart';

@riverpod
class CartNotifier extends _$CartNotifier {
  @override
  List<CartItemModel> build() {
    return [];
  }

  void addItem({
    required Product product,
    required int quantity,
  }) {
    log('addItem ${product.id} $quantity');

    final List<CartItemModel> items = List.from(state);
    final existingItemIndex = items.indexWhere(
      (item) => item.product.id == product.id,
    );

    if (existingItemIndex != -1) {
      CartItemModel item = items[existingItemIndex].copyWith(
        quantity: items[existingItemIndex].quantity + quantity,
      );

      items[existingItemIndex] = item;
    } else {
      items.add(
        CartItemModel(product: product, quantity: quantity),
      );
    }

    state = items;
  }

  void removeItem({
    required int index,
  }) {
    log('removeItem $index');

    final List<CartItemModel> items = List.from(state);
    items.removeAt(index);
    state = items;
  }

  void clearCart() {
    ref.invalidateSelf();
  }
}
