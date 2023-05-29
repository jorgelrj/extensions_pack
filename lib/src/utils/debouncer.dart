import 'dart:async';

class Debouncer {
  final Duration duration;

  Debouncer({required this.duration});

  Timer? _timer;

  Future<T?> run<T>(FutureOr<T> Function() action) {
    final completer = Completer<T?>();
    if (_timer?.isActive ?? false) {
      _timer?.cancel();
    }

    _timer = Timer(
      duration,
      () async {
        completer.complete(await action());
      },
    );

    return completer.future;
  }

  void dispose() {
    _timer?.cancel();
  }
}
