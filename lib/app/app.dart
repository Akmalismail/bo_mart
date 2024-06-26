import 'package:bo_mart/app/app_router.dart';
import 'package:bo_mart/common/constants/styles.dart';
import 'package:bo_mart/presentation/catalog/views/catalog_view.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const CatalogView(),
      initialRoute: Routes.catalogView,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
