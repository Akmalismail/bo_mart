import 'package:bo_mart/common/constants/styles.dart';
import 'package:bo_mart/presentation/catalog/views/catalog_view.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.light,
      home: const CatalogView(),
    );
  }
}
