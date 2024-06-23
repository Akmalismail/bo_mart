import 'package:bo_mart/domain/models/product.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_item_modal.freezed.dart';

@freezed
class CartItemModal with _$CartItemModal {
  const factory CartItemModal({
    required Product product,
    required int quantity,
  }) = _CartItemModal;
}
