import 'dart:async';

import 'package:bo_mart/common/utils/helper.dart';
import 'package:bo_mart/data/remote/api_client.dart';
import 'package:bo_mart/data/responses/product_response.dart';
import 'package:bo_mart/domain/models/product.dart';
import 'package:flutter/services.dart';

class ProductRepository {
  final ApiClient _apiClient;

  ProductRepository(
    this._apiClient,
  );

  Future<List<Product>> fetchProducts() async {
    // return await _apiClient.get(Endpoints.products);
    final response = await rootBundle.loadString(
      'assets/json/mock_products.json',
    );

    final parsed = await parseResponse(response, ProductResponse.fromJson);
    return parsed.products;
  }
}
