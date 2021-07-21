class StringHelper {
  static const String _EMPTY_STRING = "";

  static bool hasLength(String? str) {
    return (str != null && str.isNotEmpty);
  }

  static bool hasNotLength(String? str) => !hasLength(str);

  static bool hasText(String? str) {
    return (str != null && str.trim().isNotEmpty);
  }

  static bool hasNotText(String? str) => !hasText(str);

  static bool textEquals(String? strA, String? strB, {bool trim = true}) {
    if (trim) {
      return (strA?.trim() ?? _EMPTY_STRING) == (strB?.trim() ?? _EMPTY_STRING);
    } else {
      return (strA ?? _EMPTY_STRING) == (strB ?? _EMPTY_STRING);
    }
  }

  StringHelper._();
}
