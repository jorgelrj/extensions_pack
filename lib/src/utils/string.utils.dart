import 'package:extensions_pack/extensions_pack.dart';

class StringUtils {
  static int sortBySimilarity({
    required String similarTo,
    required String string1,
    required String string2,
  }) {
    final int1 = similarTo.similarityTo(string1);
    final int2 = similarTo.similarityTo(string2);

    return int1 >= int2 ? -1 : 1;
  }

  static String cleanMask(String text) {
    return text.replaceAll(RegExp(r'\W|_'), '');
  }
}
