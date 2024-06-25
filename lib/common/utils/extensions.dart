import 'dart:io';

import 'package:flutter/material.dart';

extension ThemeDataX on ThemeData {
  Color get borderColor => Colors.grey.shade300;
}

extension HttpHeadersX on HttpHeaders {
  static const xWCTotalPagesHeader = 'x-wc-totalpages';
  static const xWCTotalHeader = 'x-wc-total';
}
