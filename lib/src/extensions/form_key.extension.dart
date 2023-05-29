import 'package:extensions_pack/extensions_pack.dart';

extension FormKeyExtension on FormKey {
  bool get isValid {
    return currentState?.validate() ?? false;
  }

  bool validate() {
    return currentState?.validate() ?? false;
  }
}
