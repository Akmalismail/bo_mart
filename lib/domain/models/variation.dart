// ignore_for_file: invalid_annotation_target

import 'package:bo_mart/domain/models/attribute.dart';
import 'package:bo_mart/domain/models/bulk_variation_input.dart';
import 'package:bo_mart/domain/models/category.dart';
import 'package:bo_mart/domain/models/custom_fields.dart';
import 'package:bo_mart/domain/models/dimensions.dart';
import 'package:bo_mart/domain/models/inventory.dart';
import 'package:bo_mart/domain/models/product_image.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'variation.freezed.dart';
part 'variation.g.dart';

@freezed
class Variation with _$Variation {
  const factory Variation({
    required int id,
    @JsonKey(name: 'date_modified') required String dateModified,
    required String type,
    required String status,
    @JsonKey(name: 'catalog_visibility') required String catalogVisibility,
    required String sku,
    @JsonKey(name: 'regular_price') required String regularPrice,
    @JsonKey(name: 'sale_price') String? salePrice,
    @JsonKey(name: 'tax_class') String? taxClass,
    @JsonKey(name: 'manage_stock') required bool manageStock,
    @JsonKey(name: 'in_stock') required bool inStock,
    @JsonKey(name: 'stock_quantity') required int stockQuantity,
    String? weight,
    required Dimensions? dimensions,
    @JsonKey(name: 'backorders_allowed') required bool backordersAllowed,
    required String? description,
    required List<Category> categories,
    required List<String> tags,
    required List<ProductImage> images,
    required List<Inventory> inventory,
    required List<Attribute> attributes,
    @JsonKey(name: 'default_attributes')
    required List<Attribute> defaultAttributes,
    @JsonKey(name: 'bulk_variation_input')
    BulkVariationInput? bulkVariationInput,
    @JsonKey(name: 'menu_order') int? menuOrder,
    required List<Variation> variations,
    @JsonKey(name: 'custom_fields') required CustomFields customFields,
    @JsonKey(name: 'bill_of_materials') required List<String> billOfMaterials,
    @JsonKey(name: 'shipping_class_id') required int shippingClassId,
  }) = _Variation;

  factory Variation.fromJson(Map<String, Object?> json) =>
      _$VariationFromJson(json);
}
