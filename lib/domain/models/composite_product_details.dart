// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'composite_product_details.freezed.dart';
part 'composite_product_details.g.dart';

@freezed
class CompositeProductDetails with _$CompositeProductDetails {
  const factory CompositeProductDetails({
    @JsonKey(name: 'per_item_pricing') required bool perItemPricing,
    String? name,
  }) = _CompositeProductDetails;

  factory CompositeProductDetails.fromJson(Map<String, Object?> json) =>
      _$CompositeProductDetailsFromJson(json);
}
