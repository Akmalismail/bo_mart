import 'dart:async';
import 'dart:ui';

class Debouncer {
  Debouncer({
    this.milliseconds = 500,
  });

  final int milliseconds;
  Timer? _timer;

  void run(VoidCallback action) {
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
