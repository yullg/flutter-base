class NullHelper {
  static R safeFunction<T, R>(T? t, R Function(T) callback, R r) {
    return t != null ? callback(t) : r;
  }

  NullHelper._();
}
