import 'package:flutter/widgets.dart';

extension ScrollExtension on Scrollable {
  Widget noGlowScroll() {
    return ScrollConfiguration(
      behavior: NoGlowScroll(),
      child: this,
    );
  }
}

class NoGlowScroll extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
    BuildContext context,
    Widget child,
    AxisDirection axisDirection,
  ) {
    return child;
  }
}
