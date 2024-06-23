import 'dart:async';
import 'dart:convert';

import 'package:bo_mart/common/constants/endpoints.dart';
import 'package:bo_mart/common/utils/extensions.dart';
import 'package:bo_mart/common/utils/helper.dart';
import 'package:bo_mart/data/remote/api_client.dart';
import 'package:bo_mart/data/responses/product_response.dart';

class ProductRepository {
  // ignore: unused_field
  final ApiClient _apiClient;

  ProductRepository(
    this._apiClient,
  );

  Future<ProductResponse> fetchProducts(int page) async {
    final response = await _apiClient.get(
      Endpoints.products,
      query: {
        'page': page,
      },
    );
    // final response = await rootBundle.loadString(
    //   'assets/json/mock_products.json',
    // );

    final products = await parseResponse(
        jsonEncode(response.data), ProductResponse.fromJson);
    return products.copyWith(
      totalPages: int.parse(response.headers.value(
        HttpHeadersX.xWCTotalPagesHeader,
      )!),
      totalProducts: int.parse(response.headers.value(
        HttpHeadersX.xWCTotalHeader,
      )!),
    );
  }
}
