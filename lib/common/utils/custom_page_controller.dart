import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class CustomPagingController<PageKeyType, ItemType>
    extends PagingController<PageKeyType, ItemType> {
  CustomPagingController({
    required super.firstPageKey,
    super.invisibleItemsThreshold,
  });

  /// Whether it is in the state of background refresh
  bool _background = false;

  @override
  void refresh({bool background = false}) {
    if (background) {
      this._background = true;
      // Since the state of PagingState has too much influence,
      // skip it here and directly notifyPageRequestListeners.
      notifyPageRequestListeners(firstPageKey);
    } else {
      super.refresh();
    }
  }

  @override
  void appendPage(List<ItemType> newItems, PageKeyType? nextPageKey) {
    // Add judgment here
    final previousItems =
        _background ? <ItemType>[] : value.itemList ?? <ItemType>[];
    final itemList = previousItems + newItems;
    value = PagingState<PageKeyType, ItemType>(
      itemList: itemList,
      nextPageKey: nextPageKey,
    );
    // reduction
    _background = false;
  }
}
