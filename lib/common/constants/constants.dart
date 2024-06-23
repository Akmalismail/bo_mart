abstract class Constants {
  static const Duration timeout = Duration(minutes: 1);
  static const Duration fadeInOutDuration = Duration(milliseconds: 350);
}

abstract class SharedPreferencesKey {
  static const String products = '_products';
  static const String productsTotal = '_products_total';
  static const String productsTotalPages = '_products_total_pages';
}
