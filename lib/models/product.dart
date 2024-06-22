// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'product.freezed.dart';
// part 'product.g.dart';

// @freezed
// class Products {
//   int? id;
//   String? name;
//   String? dateModified;
//   String? type;
//   String? status;
//   String? catalogVisibility;
//   String? sku;
//   String? regularPrice;
//   Null? salePrice;
//   String? taxClass;
//   bool? manageStock;
//   bool? inStock;
//   int? stockQuantity;
//   Null? weight;
//   Dimensions? dimensions;
//   bool? backordersAllowed;
//   Null? description;
//   List<Categories>? categories;
//   List<Null>? tags;
//   List<Images>? images;
//   List<Attributes>? attributes;
//   List<Null>? defaultAttributes;
//   BulkVariationInput? bulkVariationInput;
//   int? menuOrder;
//   List<Variations>? variations;
//   CustomFields? customFields;
//   List<Null>? customFieldsV2;
//   List<Null>? inventory;
//   CompositeProductDetails? compositeProductDetails;

//   Products(
//       {this.id,
//       this.name,
//       this.dateModified,
//       this.type,
//       this.status,
//       this.catalogVisibility,
//       this.sku,
//       this.regularPrice,
//       this.salePrice,
//       this.taxClass,
//       this.manageStock,
//       this.inStock,
//       this.stockQuantity,
//       this.weight,
//       this.dimensions,
//       this.backordersAllowed,
//       this.description,
//       this.categories,
//       this.tags,
//       this.images,
//       this.attributes,
//       this.defaultAttributes,
//       this.bulkVariationInput,
//       this.menuOrder,
//       this.variations,
//       this.customFields,
//       this.customFieldsV2,
//       this.inventory,
//       this.compositeProductDetails});

//   Products.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     dateModified = json['date_modified'];
//     type = json['type'];
//     status = json['status'];
//     catalogVisibility = json['catalog_visibility'];
//     sku = json['sku'];
//     regularPrice = json['regular_price'];
//     salePrice = json['sale_price'];
//     taxClass = json['tax_class'];
//     manageStock = json['manage_stock'];
//     inStock = json['in_stock'];
//     stockQuantity = json['stock_quantity'];
//     weight = json['weight'];
//     dimensions = json['dimensions'] != null
//         ? new Dimensions.fromJson(json['dimensions'])
//         : null;
//     backordersAllowed = json['backorders_allowed'];
//     description = json['description'];
//     if (json['categories'] != null) {
//       categories = <Categories>[];
//       json['categories'].forEach((v) {
//         categories!.add(new Categories.fromJson(v));
//       });
//     }
//     if (json['tags'] != null) {
//       tags = <Null>[];
//       json['tags'].forEach((v) {
//         tags!.add(new Null.fromJson(v));
//       });
//     }
//     if (json['images'] != null) {
//       images = <Images>[];
//       json['images'].forEach((v) {
//         images!.add(new Images.fromJson(v));
//       });
//     }
//     if (json['attributes'] != null) {
//       attributes = <Attributes>[];
//       json['attributes'].forEach((v) {
//         attributes!.add(new Attributes.fromJson(v));
//       });
//     }
//     if (json['default_attributes'] != null) {
//       defaultAttributes = <Null>[];
//       json['default_attributes'].forEach((v) {
//         defaultAttributes!.add(new Null.fromJson(v));
//       });
//     }
//     bulkVariationInput = json['bulk_variation_input'] != null
//         ? new BulkVariationInput.fromJson(json['bulk_variation_input'])
//         : null;
//     menuOrder = json['menu_order'];
//     if (json['variations'] != null) {
//       variations = <Variations>[];
//       json['variations'].forEach((v) {
//         variations!.add(new Variations.fromJson(v));
//       });
//     }
//     customFields = json['custom_fields'] != null
//         ? new CustomFields.fromJson(json['custom_fields'])
//         : null;
//     if (json['custom_fields_v2'] != null) {
//       customFieldsV2 = <Null>[];
//       json['custom_fields_v2'].forEach((v) {
//         customFieldsV2!.add(new Null.fromJson(v));
//       });
//     }
//     if (json['inventory'] != null) {
//       inventory = <Null>[];
//       json['inventory'].forEach((v) {
//         inventory!.add(new Null.fromJson(v));
//       });
//     }
//     compositeProductDetails = json['composite_product_details'] != null
//         ? new CompositeProductDetails.fromJson(
//             json['composite_product_details'])
//         : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['date_modified'] = this.dateModified;
//     data['type'] = this.type;
//     data['status'] = this.status;
//     data['catalog_visibility'] = this.catalogVisibility;
//     data['sku'] = this.sku;
//     data['regular_price'] = this.regularPrice;
//     data['sale_price'] = this.salePrice;
//     data['tax_class'] = this.taxClass;
//     data['manage_stock'] = this.manageStock;
//     data['in_stock'] = this.inStock;
//     data['stock_quantity'] = this.stockQuantity;
//     data['weight'] = this.weight;
//     if (this.dimensions != null) {
//       data['dimensions'] = this.dimensions!.toJson();
//     }
//     data['backorders_allowed'] = this.backordersAllowed;
//     data['description'] = this.description;
//     if (this.categories != null) {
//       data['categories'] = this.categories!.map((v) => v.toJson()).toList();
//     }
//     if (this.tags != null) {
//       data['tags'] = this.tags!.map((v) => v.toJson()).toList();
//     }
//     if (this.images != null) {
//       data['images'] = this.images!.map((v) => v.toJson()).toList();
//     }
//     if (this.attributes != null) {
//       data['attributes'] = this.attributes!.map((v) => v.toJson()).toList();
//     }
//     if (this.defaultAttributes != null) {
//       data['default_attributes'] =
//           this.defaultAttributes!.map((v) => v.toJson()).toList();
//     }
//     if (this.bulkVariationInput != null) {
//       data['bulk_variation_input'] = this.bulkVariationInput!.toJson();
//     }
//     data['menu_order'] = this.menuOrder;
//     if (this.variations != null) {
//       data['variations'] = this.variations!.map((v) => v.toJson()).toList();
//     }
//     if (this.customFields != null) {
//       data['custom_fields'] = this.customFields!.toJson();
//     }
//     if (this.customFieldsV2 != null) {
//       data['custom_fields_v2'] =
//           this.customFieldsV2!.map((v) => v.toJson()).toList();
//     }
//     if (this.inventory != null) {
//       data['inventory'] = this.inventory!.map((v) => v.toJson()).toList();
//     }
//     if (this.compositeProductDetails != null) {
//       data['composite_product_details'] =
//           this.compositeProductDetails!.toJson();
//     }
//     return data;
//   }
// }
