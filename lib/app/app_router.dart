import 'package:bo_mart/presentation/cart/views/cart_view.dart';
import 'package:bo_mart/presentation/catalog/views/catalog_view.dart';
import 'package:flutter/material.dart';

class Routes {
  static const catalogView = 'CatalogView';
  static const cartView = 'CartView';
}

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.catalogView:
        return MaterialPageRoute(
          builder: (context) => const CatalogView(),
        );

      case Routes.cartView:
        return MaterialPageRoute(
          builder: (context) => const CartView(),
        );

      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => const Scaffold(
        body: Center(
          child: Text('No route found.'),
        ),
      ),
    );
  }
}
