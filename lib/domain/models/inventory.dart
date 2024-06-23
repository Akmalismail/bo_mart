// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'inventory.freezed.dart';
part 'inventory.g.dart';

@freezed
class Inventory with _$Inventory {
  const factory Inventory({
    @JsonKey(name: 'branch_id') required int branchId,
    @JsonKey(name: 'batch_id') int? batchId,
    @JsonKey(name: 'stock_quantity') required int stockQuantity,
    @JsonKey(name: 'physical_stock_quantity')
    required int physicalStockQuantity,
  }) = _Inventory;

  factory Inventory.fromJson(Map<String, Object?> json) =>
      _$InventoryFromJson(json);
}
