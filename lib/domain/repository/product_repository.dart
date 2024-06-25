import 'dart:async';
import 'dart:convert';

import 'package:bo_mart/common/constants/constants.dart';
import 'package:bo_mart/common/constants/endpoints.dart';
import 'package:bo_mart/common/utils/extensions.dart';
import 'package:bo_mart/common/utils/helper.dart';
import 'package:bo_mart/data/remote/api_client.dart';
import 'package:bo_mart/data/responses/product_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductRepository {
  final ApiClient _apiClient;

  ProductRepository(
    this._apiClient,
  );

  Future<ProductResponse> fetchProducts(int page) async {
    try {
      final response = await _apiClient.get(
        Endpoints.products,
        query: {
          'page': page,
        },
      );

      final products = await parseResponse(
        jsonEncode(response.data),
        ProductResponse.fromJson,
      );
      final int totalPages = int.parse(
        response.headers.value(
          HttpHeadersX.xWCTotalPagesHeader,
        )!,
      );
      final int totalProducts = int.parse(
        response.headers.value(
          HttpHeadersX.xWCTotalHeader,
        )!,
      );

      unawaited(
        _storeProducts(
          response: products.copyWith(
            totalPages: totalPages,
            totalProducts: totalProducts,
            currentPage: page,
          ),
        ),
      );

      return products.copyWith(
        totalPages: totalPages,
        totalProducts: totalProducts,
        currentPage: page,
      );
    } on Exception catch (_) {
      return _fetchProductsFromLocal(page);
    }
  }

  Future<void> _storeProducts({
    required ProductResponse response,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      '${SharedPreferencesKey.products}_${response.currentPage}',
      jsonEncode(response.toJson()),
    );
  }

  Future<ProductResponse> _fetchProductsFromLocal(int page) async {
    final prefs = await SharedPreferences.getInstance();

    final String? response = prefs.getString(
      '${SharedPreferencesKey.products}_$page',
    );

    if (response == null) {
      return Future.error(Exception('No data in local'));
    }

    final products = await parseResponse(
      response,
      ProductResponse.fromJson,
    );

    return products;
  }
}
