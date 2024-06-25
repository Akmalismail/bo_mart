import 'package:bo_mart/domain/models/product.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_response.freezed.dart';
part 'product_response.g.dart';

@freezed
class ProductResponse with _$ProductResponse {
  const factory ProductResponse({
    required List<Product> products,
    @Default(0) int totalPages,
    @Default(0) int totalProducts,
    @Default(1) int currentPage,
  }) = _ProductResponse;

  factory ProductResponse.fromJson(Map<String, Object?> json) =>
      _$ProductResponseFromJson(json);
}
