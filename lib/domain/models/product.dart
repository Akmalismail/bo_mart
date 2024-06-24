import 'package:bo_mart/domain/models/attribute.dart';
import 'package:bo_mart/domain/models/bulk_variation_input.dart';
import 'package:bo_mart/domain/models/category.dart';
import 'package:bo_mart/domain/models/composite_product_details.dart';
import 'package:bo_mart/domain/models/custom_fields.dart';
import 'package:bo_mart/domain/models/dimensions.dart';
import 'package:bo_mart/domain/models/inventory.dart';
import 'package:bo_mart/domain/models/product_image.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
class Product with _$Product {
  const Product._();

  const factory Product({
    required int id,
    String? name,
    @JsonKey(name: 'date_modified') String? dateModified,
    String? type,
    String? status,
    @JsonKey(name: 'catalog_visibility') String? catalogVisibility,
    required String sku,
    @JsonKey(name: 'regular_price') required String regularPrice,
    @JsonKey(name: 'sale_price') String? salePrice,
    @JsonKey(name: 'tax_class') String? taxClass,
    @JsonKey(name: 'manage_stock') bool? manageStock,
    @JsonKey(name: 'in_stock') bool? inStock,
    @JsonKey(name: 'stock_quantity') required int stockQuantity,
    String? weight,
    Dimensions? dimensions,
    @JsonKey(name: 'backorders_allowed') bool? backordersAllowed,
    String? description,
    List<Category>? categories,
    List<String>? tags,
    required List<ProductImage> images,
    List<Attribute>? attributes,
    @JsonKey(name: 'default_attributes') List<String>? defaultAttributes,
    @JsonKey(name: 'bulk_variation_input')
    BulkVariationInput? bulkVariationInput,
    @JsonKey(name: 'menu_order') int? menuOrder,
    List<Product>? variations,
    @JsonKey(name: 'custom_fields') CustomFields? customFields,
    @JsonKey(name: 'custom_fields_v2') List<String>? customFieldsV2,
    List<Inventory>? inventory,
    @JsonKey(name: 'composite_product_details')
    CompositeProductDetails? compositeProductDetails,
    @JsonKey(name: 'shipping_class_id') int? shippingClassId,
  }) = _Product;

  factory Product.fromJson(Map<String, Object?> json) =>
      _$ProductFromJson(json);

  @override
  String toString() {
    return 'Product: id - $id, name - $name';
  }
}
