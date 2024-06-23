// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_image.freezed.dart';
part 'product_image.g.dart';

@freezed
class ProductImage with _$ProductImage {
  const factory ProductImage({
    required String src,
    @JsonKey(name: 'src_small') required String srcSmall,
    @JsonKey(name: 'src_medium') required String srcMedium,
    @JsonKey(name: 'src_large') required String srcLarge,
  }) = _ProductImage;

  factory ProductImage.fromJson(Map<String, Object?> json) =>
      _$ProductImageFromJson(json);
}
