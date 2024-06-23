// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'custom_fields.freezed.dart';
part 'custom_fields.g.dart';

@freezed
class CustomFields with _$CustomFields {
  const factory CustomFields({
    @JsonKey(name: 'conversionrate') String? conversionRate,
    @JsonKey(name: 'conversionrategroup') String? conversionRateGroup,
    @JsonKey(name: 'variation_barcode') String? variationBarcode,
    @JsonKey(name: 'minprice') String? minPrice,
    @JsonKey(name: 'to_hide') String? toHide,
    @JsonKey(name: 'stock_quantity_overwrite') String? stockQuantityOverwrite,
    @JsonKey(name: 'variation_shelf') String? variationShelf,
    @JsonKey(name: 'sales_item') String? salesItem,
    @JsonKey(name: 'internal_sales_item') String? internetSalesItem,
    @JsonKey(name: 'inventory_item') String? inventoryItem,
    @JsonKey(name: 'disallow_children_backorders')
    String? disallowChildrenBackorders,
    @JsonKey(name: 'to_hide_during_picking_and_packing')
    String? toHideDuringPickingAndPacking,
    @JsonKey(name: 'date_valid_from') String? dateValidFrom,
    @JsonKey(name: 'date_valid_to') String? dateValidTo,
    @JsonKey(name: 'drive_item') String? driveItem,
    @JsonKey(name: 'source') String? source,
    @JsonKey(name: 'group') String? group,
    @JsonKey(name: 'customers') String? customers,
    @JsonKey(name: 'price_tags') String? priceTags,
    @JsonKey(name: 'discontinued') String? discontinued,
    @JsonKey(name: 'article_code') String? articleCode,
    @JsonKey(name: 'barcode') String? barcode,
    @JsonKey(name: 'internal_description') String? internalDescription,
    @JsonKey(name: 'is_suspended') String? isSuspended,
    @JsonKey(name: 'parent_sku') String? parentSku,
    @JsonKey(name: 'title_2') String? title_2,
    @JsonKey(name: 'supplier_code') String? supplierCode,
    @JsonKey(name: 'split_group') String? splitGroup,
    @JsonKey(name: 'customer_tiers') String? customerTiers,
    @JsonKey(name: 'lead_time') String? leadTime,
    @JsonKey(name: 'ratio_1') String? ratio_1,
    @JsonKey(name: 'ratio_2') String? ratio_2,
    @JsonKey(name: 'external_id') String? externalId,
  }) = _CustomField;

  factory CustomFields.fromJson(Map<String, Object?> json) =>
      _$CustomFieldsFromJson(json);
}
