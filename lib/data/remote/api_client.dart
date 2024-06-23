import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bo_mart/common/constants/constants.dart';
import 'package:bo_mart/common/utils/extensions.dart';
import 'package:bo_mart/data/api_exception.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

/// ApiClient contains Dio client.
/// This client is used to communicate with the backend.
class ApiClient {
  late final Dio _dio;

  ApiClient._();

  static Future<ApiClient> initialize() async {
    final client = ApiClient._();
    await client._initializeDio();
    return client;
  }

  Dio get dio => _dio;

  Future<void> _initializeDio() async {
    Dio dio = Dio();
    final username = dotenv.env['USERNAME'];
    final password = dotenv.env['PASSWORD'];

    Map<String, dynamic> headers = {
      Headers.contentTypeHeader: Headers.jsonContentType,
      'Authorization':
          'Basic ${base64.encode(utf8.encode('$username:$password'))}'
    };

    dio.options = BaseOptions(
      baseUrl: dotenv.env['API_URL']!,
      connectTimeout: Constants.timeout,
      receiveTimeout: Constants.timeout,
      headers: headers,
    );

    if (!kReleaseMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          responseBody: false,
          // request: true,
          // requestHeader: true,
          // requestBody: true,
          // responseHeader: true,
          // responseBody: true,
          // error: true,
        ),
      );
    }

    _dio = dio;
  }

  Future<Response> get(
    String endpoint, {
    Map<String, dynamic>? query,
  }) async {
    final isConnected = await Connectivity().isConnected;

    if (!isConnected) {
      return Future.error(NoInternetException());
    }

    try {
      final response = await _dio.get(
        endpoint,
        queryParameters: query,
      );
      return response;
    } on DioException {
      rethrow;
    }
  }
}

extension DioExceptionX on DioException {
  bool get isNoConnectionError {
    return type == DioExceptionType.unknown && error is SocketException;
  }
}
