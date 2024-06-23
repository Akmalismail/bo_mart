import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

extension ThemeDataX on ThemeData {
  Color get borderColor => Colors.grey.shade300;
}

extension ConnectivityX on Connectivity {
  Future<bool> get isConnected async {
    final connectivityResult = await checkConnectivity();

    return connectivityResult.any(
      [
        ConnectivityResult.wifi,
        ConnectivityResult.ethernet,
        ConnectivityResult.mobile,
        ConnectivityResult.vpn,
      ].contains,
    );
  }
}

extension HttpHeadersX on HttpHeaders {
  static const xWCTotalPagesHeader = 'x-wc-totalpages';
  static const xWCTotalHeader = 'x-wc-total';
}
