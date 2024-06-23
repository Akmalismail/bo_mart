import 'package:freezed_annotation/freezed_annotation.dart';

part 'attribute.freezed.dart';
part 'attribute.g.dart';

@freezed
class Attribute with _$Attribute {
  const factory Attribute({
    required int id,
    required String name,
    required String slug,
    int? position,
    bool? visible,
    bool? variation,
    List<String>? options,
  }) = _Attribute;

  factory Attribute.fromJson(Map<String, Object?> json) =>
      _$AttributeFromJson(json);
}
