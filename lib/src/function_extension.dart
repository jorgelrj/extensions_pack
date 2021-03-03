import 'package:flutter/foundation.dart';

extension VoidCallbackExtension on VoidCallback {
  Future delayed(Duration duration) => Future.delayed(duration, this);
}
