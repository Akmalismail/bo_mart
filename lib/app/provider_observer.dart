import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class Observer extends ProviderObserver {
  @override
  void didAddProvider(
    ProviderBase<Object?> provider,
    Object? value,
    ProviderContainer container,
  ) {
    log('[Provider Observer] ${provider.name} was initialized with $value');
  }

  @override
  void didDisposeProvider(
    ProviderBase<Object?> provider,
    ProviderContainer container,
  ) {
    log('[Provider Observer] ${provider.name} was disposed');
  }

  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    log(
      '[Provider Observer] ${provider.name} updated from $previousValue to $newValue',
    );
  }

  @override
  void providerDidFail(
    ProviderBase<Object?> provider,
    Object error,
    StackTrace stackTrace,
    ProviderContainer container,
  ) {
    log('[Provider Observer] ${provider.name} threw $error at $stackTrace');
  }
}
