import 'package:freezed_annotation/freezed_annotation.dart';

part 'dimensions.freezed.dart';
part 'dimensions.g.dart';

@freezed
class Dimensions with _$Dimensions {
  const factory Dimensions({
    double? height,
    double? width,
    double? length,
  }) = _Dimensions;

  factory Dimensions.fromJson(Map<String, Object?> json) =>
      _$DimensionsFromJson(json);
}
