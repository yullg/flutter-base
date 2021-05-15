class CollectionHelper {
  static bool equals(Iterable as, Iterable bs) {
    if (as == bs) return true;
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
