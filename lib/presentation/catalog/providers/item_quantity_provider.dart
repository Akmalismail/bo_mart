import 'package:bo_mart/domain/models/product.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'item_quantity_provider.g.dart';

@riverpod
class ItemQuantityNotifier extends _$ItemQuantityNotifier {
  @override
  int build(Product product) => 1;
  void increment() => state++;
  void decrement() => state--;
}
