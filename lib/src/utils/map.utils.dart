class MapUtils {
  /// Omit every entry where key matches path
  static Map? omit(Map? object, List<String> paths) {
    if (object == null) {
      return null;
    }

    for (final path in paths) {
      final crumbs = path.split('.');
      if (crumbs.isEmpty) {
        return object;
      }
      if (crumbs.length > 1) {
        final dynamic nested = object[crumbs[0]];
        if (nested is List<Map>) {
          for (var e in nested) {
            omit(e, [crumbs.sublist(1, crumbs.length).join('.')]);
          }
        } else if (nested is Map) {
          omit(nested, [crumbs.sublist(1, crumbs.length).join('.')]);
        }
      } else {
        object.remove(path);
      }
    }

    return object;
  }
}
