// ignore_for_file: invalid_annotation_target

import 'package:bo_mart/domain/models/attribute.dart';
import 'package:bo_mart/domain/models/bulk_variation_input.dart';
import 'package:bo_mart/domain/models/category.dart';
import 'package:bo_mart/domain/models/composite_product_details.dart';
import 'package:bo_mart/domain/models/custom_fields.dart';
import 'package:bo_mart/domain/models/dimensions.dart';
import 'package:bo_mart/domain/models/inventory.dart';
import 'package:bo_mart/domain/models/product_image.dart';
import 'package:bo_mart/domain/models/variation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
class Product with _$Product {
  const factory Product({
    required int id,
    required String name,
    String? dateModified,
    String? type,
    String? status,
    String? catalogVisibility,
    required String sku,
    @JsonKey(name: 'regular_price') required String regularPrice,
    @JsonKey(name: 'sale_price') String? salePrice,
    String? taxClass,
    bool? manageStock,
    bool? inStock,
    @JsonKey(name: 'stock_quantity') required int stockQuantity,
    double? weight,
    Dimensions? dimensions,
    bool? backordersAllowed,
    String? description,
    List<Category>? categories,
    List<String>? tags,
    required List<ProductImage> images,
    List<Attribute>? attributes,
    List<String>? defaultAttributes,
    @JsonKey(name: 'bulk_variation_input')
    BulkVariationInput? bulkVariationInput,
    int? menuOrder,
    List<Variation>? variations,
    CustomFields? customFields,
    List<String>? customFieldsV2,
    List<Inventory>? inventory,
    CompositeProductDetails? compositeProductDetails,
  }) = _Product;

  factory Product.fromJson(Map<String, Object?> json) =>
      _$ProductFromJson(json);

  @override
  String toString() {
    return super.name;
  }
}
