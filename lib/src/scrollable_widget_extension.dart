import 'package:flutter/widgets.dart';

extension ScrollableExtension on Widget {
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
