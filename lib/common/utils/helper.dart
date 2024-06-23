import 'dart:convert';

import 'package:flutter/foundation.dart';

Future<T> parseResponse<T>(
    String response, T Function(Map<String, Object?> json) mapper) async {
  final parsed = jsonDecode(response);

  return await compute<Map<String, Object?>, T>(mapper, parsed);
}
