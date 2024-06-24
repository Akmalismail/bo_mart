import 'dart:convert';

import 'package:bo_mart/domain/models/product.dart';
import 'package:flutter/foundation.dart';

Future<T> parseResponse<T>(
  String response,
  T Function(Map<String, Object?> json) mapper,
) async {
  final parsed = jsonDecode(response);

  return await compute<Map<String, Object?>, T>(mapper, parsed);
}

int calculateStock(Product variation, Product product) {
  if (variation.inventory != null) {
    return variation.inventory!.fold<int>(
      0,
      (previousValue, element) => previousValue + element.stockQuantity <= 0
          ? 0
          : element.stockQuantity,
    );
  }

  return product.stockQuantity;
}
