// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'bulk_variation_input.freezed.dart';
part 'bulk_variation_input.g.dart';

@freezed
class BulkVariationInput with _$BulkVariationInput {
  const factory BulkVariationInput({
    @JsonKey(name: 'bulk_variation_form') required bool bulkVariationForm,
    int? columns,
    int? rows,
  }) = _BulkVariationInput;

  factory BulkVariationInput.fromJson(Map<String, Object?> json) =>
      _$BulkVariationInputFromJson(json);
}
