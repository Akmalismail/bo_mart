import 'package:bo_mart/domain/models/product.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_item_model.freezed.dart';

@freezed
class CartItemModel with _$CartItemModel {
  const CartItemModel._();

  const factory CartItemModel({
    required Product product,
    required int quantity,
    required Product variation,
  }) = _CartItemModal;

  @override
  String toString() {
    return 'Item: ${product.id},${product.name}, Quantity $quantity';
  }
}
