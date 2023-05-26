import 'package:flutter/foundation.dart';

extension VoidCallbackEPExtension on VoidCallback {
  Future delayed(Duration duration) => Future.delayed(duration, this);
}
