class CollectionHelper {
  static const _EMPTY_ITERABLE = [];

  static bool elementEquals(Iterable? as, Iterable? bs) {
    if (as == bs) return true;
    as ??= _EMPTY_ITERABLE;
    bs ??= _EMPTY_ITERABLE;
    if (as.length == bs.length) {
      for (int i = 0; i < as.length; i++) {
        if (as.elementAt(i) != bs.elementAt(i)) {
          return false;
        }
      }
      return true;
    }
    return false;
  }

  CollectionHelper._();
}
