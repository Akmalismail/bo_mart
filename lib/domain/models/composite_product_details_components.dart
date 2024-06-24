// ignore_for_file: invalid_annotation_target

import 'package:bo_mart/domain/models/product.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'composite_product_details_components.freezed.dart';
part 'composite_product_details_components.g.dart';

@freezed
class CompositeProductDetailsComponents
    with _$CompositeProductDetailsComponents {
  const factory CompositeProductDetailsComponents({
    @JsonKey(name: 'per_item_pricing') required bool perItemPricing,
    required List<Product> product,
    @JsonKey(name: 'number_of_different_products_allowed')
    String? numberOfDifferentProductsAllowed,
    @JsonKey(name: 'minimum_quantity') String? minimumQuantity,
    @JsonKey(name: 'maximum_quantity') String? maximumQuantity,
    @JsonKey(name: 'different_sku_free_quantity')
    String? differentSkuFreeQuantity,
    @JsonKey(name: 'discount_percentage') String? discountPercentage,
    @JsonKey(name: 'discount_on_regular_price') String? discountOnRegularPrice,
    @JsonKey(name: 'discount_amount') String? discountAmount,
    String? price,
    @JsonKey(name: 'composite_minimum_order') String? compositeMinimumOrder,
  }) = _CompositeProductDetailsComponents;

  factory CompositeProductDetailsComponents.fromJson(
    Map<String, Object?> json,
  ) =>
      _$CompositeProductDetailsComponentsFromJson(json);
}
